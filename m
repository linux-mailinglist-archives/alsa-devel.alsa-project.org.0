Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB206E26F9
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 17:28:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 452EBE81;
	Fri, 14 Apr 2023 17:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 452EBE81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681486082;
	bh=IYMUsl30h/GUzS+5CbazXcfN+uxEWIFS8rfA8c8hyh4=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=vHO28FsVFGHDLvpPQZUy3PXBE2j/RgjWGMKh2RuNvvunpQDnBQ71EpfIZu/qLnk96
	 K7Z78XTEz0DI4Fkgv5xNGsZEjtFGIOHWoDu3EwgrjsiVSzpIn0xsFzXYV0haMEKnky
	 msdYPm1p1tRHV0LMP7u1YAJ0+wyFi58dPoPn3JQY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A900DF8052E;
	Fri, 14 Apr 2023 17:26:17 +0200 (CEST)
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
Subject: [PATCH v1 4/4] ALSA: hda/realtek: Delete cs35l41 component master
 during free
Date: Fri, 14 Apr 2023 16:25:52 +0100
In-Reply-To: <20230414152552.574502-1-sbinding@opensource.cirrus.com>
References: <20230414152552.574502-1-sbinding@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TXZF5UZEYX2OEEPXN4YH5IFPHR3PRV2I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168148597653.26.9417569568632907166@mailman-core.alsa-project.org>
From: Stefan Binding via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com,
 Stefan Binding <sbinding@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A9B0F8032B; Fri, 14 Apr 2023 17:26:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BC29F80448
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 17:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BC29F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=lffR9rAF
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33EDVEGp030487;
	Fri, 14 Apr 2023 10:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=uiepQRJc6hSwibfyXox6IpHGvJY0zVutwuW3J5LXHm8=;
 b=lffR9rAF2TvlA5UVdy2L784HaL99xv6BEHVEVqtxMGmiSImaAEBm8a+hm97At8fmn49Z
 Y15Hu9cxquqpWi/5ApRHSpOqjTSEslpVaBVQiNmj2zMLVMo2kGdp306fYsiCJUr7HSM6
 UhbXCVI/7Dnj+iIqIDZ0b5reAPGh9D6azwwWXn/7tk7uIebRI1UVqATtRJvyCkFW4yuL
 1Ff9PNaKlpfwu4O8hdBUWKqb5NpR6imTE33QJpogBpdKAyU4K7Uj+rmC1un2nX46NjZe
 N/27btx8c3WXXdLcBbMH1xldfJlcY++fkrofl3hcd+EvdRTUQDEPdR9++E6oV/Fj7vRA Xw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pu5p3skxn-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Apr 2023 10:26:03 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 14 Apr
 2023 10:26:00 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Apr 2023 10:26:00 -0500
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.135])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0980845D;
	Fri, 14 Apr 2023 15:26:00 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
Subject: [PATCH v1 4/4] ALSA: hda/realtek: Delete cs35l41 component master
 during free
Date: Fri, 14 Apr 2023 16:25:52 +0100
Message-ID: <20230414152552.574502-5-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414152552.574502-1-sbinding@opensource.cirrus.com>
References: <20230414152552.574502-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: E2mLVeeRv9wTXg4ldyB9dpCwOjvo4cvB
X-Proofpoint-GUID: E2mLVeeRv9wTXg4ldyB9dpCwOjvo4cvB
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: TXZF5UZEYX2OEEPXN4YH5IFPHR3PRV2I
X-Message-ID-Hash: TXZF5UZEYX2OEEPXN4YH5IFPHR3PRV2I
X-MailFrom: prvs=9468da70c5=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com,
 Stefan Binding <sbinding@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TXZF5UZEYX2OEEPXN4YH5IFPHR3PRV2I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This ensures that the driver is properly cleaned up when freed.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3b9f077a227f7..bbeffbb84091e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6757,6 +6757,8 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 		else
 			spec->gen.pcm_playback_hook = comp_generic_playback_hook;
 		break;
+	case HDA_FIXUP_ACT_FREE:
+		component_master_del(dev, &comp_master_ops);
 	}
 }
 
-- 
2.34.1

