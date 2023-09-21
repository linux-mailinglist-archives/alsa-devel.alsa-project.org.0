Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 778257AA275
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 23:18:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71124AE8;
	Thu, 21 Sep 2023 23:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71124AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695331108;
	bh=4WzhXX1uaBfz0iPkLduXsSe9s+j07QrDW6eVjUz4YQc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QlFmvetUrizCHJQiqGXg/PH1yrpr+rFS1VNQDaORjXVLtLK4kQT7zdaQtm22jK4AH
	 w0RpfqycHne31aw40V5o0qC6C0H+Pi/GAcApHsSEQiM+D2AmpRVjcmWBHYZr/Ek+vK
	 1c85bSZ3AnMeidskHh8Ao/gKSwu74+JzryA0cXyk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DFF6F80558; Thu, 21 Sep 2023 23:17:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 747CCF80125;
	Thu, 21 Sep 2023 23:17:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F011EF80124; Thu, 21 Sep 2023 23:11:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87B85F80124
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 23:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87B85F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Xq+7sEqK
Received: from notapiano.myfiosgateway.com (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E071366072A2;
	Thu, 21 Sep 2023 22:08:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695330485;
	bh=4WzhXX1uaBfz0iPkLduXsSe9s+j07QrDW6eVjUz4YQc=;
	h=From:To:Cc:Subject:Date:From;
	b=Xq+7sEqKMT1vt4K2chwQVwiFPZh87u8UZcHR85YtRTxEST+m/bOEzap9pEDI/jlvN
	 Bc2E4iawedB1CvcQfsWQ+SdjoYUMhCQ6w5uIybBe4T4KSyGY2ZH3qEyepqXCq8TylO
	 REOdNMAuaQ95GP79HV1mStHUe0Zb1hued3xRm6AhJgpipF59NKVzsvi9fe2x3b4p0Y
	 dWp3gWQsUx+IbolK/IvPrioWEF97/lKb6ENurhUFp9thNde9DqTs/n15P4CGbvoyO5
	 w/glxgy8t7xhjp2/QuKtQ1ZHA2VftQ23iKelU92xiazICGo+rMJeA9B2Wq76p6J1Am
	 p6bhSKYwpqY8g==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH] kselftest/alsa: Add configuration for
 mt8192-asurada-spherion
Date: Thu, 21 Sep 2023 17:07:42 -0400
Message-ID: <20230921210800.230330-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NTY5A7LSV2XJXG3VEF3ROGQVRXAPQWX7
X-Message-ID-Hash: NTY5A7LSV2XJXG3VEF3ROGQVRXAPQWX7
X-MailFrom: nfraprado@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NTY5A7LSV2XJXG3VEF3ROGQVRXAPQWX7/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a configuration file for the mt8192-asurada-spherion platform to
validate that the card and PCMs used for speaker, headphone and
microphones (internal and headset) are correctly exposed to userspace.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---
Sending this patch as RFC because I'd like to ask a question. What would
be the most suitable entry to identify the card in a future-proof way?

I have used the card ID here, but given that it is generated at runtime
with the purpose of being unique among the cards present on the system
(and I couldn't find any documentation that states it is stable), I'm
not sure it is supposed to be relied on.

The card ID is derived from the driver name or card longname, which are
themselves stable given userspace (alsa-ucm-conf) relies on them, but
those aren't exposed through sysfs so I can't check for them here.

Another option would be to look for the card number 0. But in the (very
unlikely) case that another soundcard would be connected to the platform
and detected first during boot, it wouldn't work.

Yet another option would be to look at the device's uevent file for
the compatible as defined in the Devicetree, ie

        path "device/uevent"
        regex "OF_COMPATIBLE_.*=mediatek,mt8192_mt6359_rt1015p_rt5682"

Though it is possible (in rare circumstances) for the compatible in the
Devicetree to need to be updated to enable a driver behavior that isn't
backward compatible.

I realize most of these issues are very rare and probably won't ever
occur, but it seems worthwhile to use the most future-proof mechanism
available to identify the card to avoid unnecessary maintenance, even
more so considering the example would be followed by future
configurations.

Thanks,
Nícolas

 .../alsa/conf.d/mt8192-asurada-spherion.conf  | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/conf.d/mt8192-asurada-spherion.conf

diff --git a/tools/testing/selftests/alsa/conf.d/mt8192-asurada-spherion.conf b/tools/testing/selftests/alsa/conf.d/mt8192-asurada-spherion.conf
new file mode 100644
index 000000000000..6a7e15dc17da
--- /dev/null
+++ b/tools/testing/selftests/alsa/conf.d/mt8192-asurada-spherion.conf
@@ -0,0 +1,32 @@
+sysfs [
+	{
+		path "firmware/devicetree/base/compatible"
+		regex "google,spherion"
+	}
+]
+
+card.mt8192 {
+	sysfs [
+		{
+			path "id"
+			regex "mt8192mt6359rt1"
+		}
+	]
+
+	pcm.0.0 {
+		PLAYBACK {
+		}
+	}
+	pcm.3.0 {
+		PLAYBACK {
+		}
+	}
+	pcm.10.0 {
+		CAPTURE {
+		}
+	}
+	pcm.11.0 {
+		CAPTURE {
+		}
+	}
+}
-- 
2.42.0

