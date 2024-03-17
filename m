Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 170C087DC45
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 03:43:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 809212367;
	Sun, 17 Mar 2024 03:43:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 809212367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710643391;
	bh=+7cDV8phINR1H1W2BobAARDGMcLQfzXEtzNFenr5xMA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hVORzA1hNXvCvW9NjxS2cdld4LjfFDJWwEJvSKwHtyF45zBIq2JgKlR2Up32fJZP9
	 dbi6se7yYbMZW41mQJu/HlkX5Gk18vg7yDYJESiuy5/12iR9vI0F+Ujl9DPsnCCYvC
	 A4xrWHCWeZvGRn/tgRfNY99Mc0R1N1rPUNZsHoXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3589DF805A0; Sun, 17 Mar 2024 03:42:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B659F805A0;
	Sun, 17 Mar 2024 03:42:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9BEFF804E7; Sun, 17 Mar 2024 03:41:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E43C7F80093
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 03:40:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E43C7F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=Y2UQnqVK;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=E3ZvrOxV
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6892411400D8;
	Sat, 16 Mar 2024 22:40:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 16 Mar 2024 22:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1710643255; x=1710729655; bh=WmHVOfjtWO
	K35eMLmsN+DCJxmeYJ3Vwg3IoKTI8rlrI=; b=Y2UQnqVKVHrmbnJpBgoadzNSQ7
	ivPGo98hoHTbtbx1pB0GQkVHN/Qx4FDpEt4dGE+tpuiBZB6nXeJ0rhGtdRykXvAF
	JiI+uwhrGU5oecBlfV8brNG0ZXD1VMLsSsySWtd/7y5M3dciemFUwpwEPuKQ4Nh3
	504UGdwB/XKZwwCOFNWLbYPLSo6QoNoHQfnPUYrsVO1L9olGfJk6jKx7GfQ3ZhuJ
	6cIrOOO3w7iOp0XLt5GsbLgmENV8+1G7oSIhkAyBi6e2NVUPohLGDUUpSTN6PU2v
	5Be+FPkIftoSPo0Z7u2sFEngnPCY6MJ16bFnECNTaru/PWE11pZDr4Fxj9uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710643255; x=1710729655; bh=WmHVOfjtWOK35eMLmsN+DCJxmeYJ
	3Vwg3IoKTI8rlrI=; b=E3ZvrOxV9+rMlhFWvlywe1eVHQM589OQCCSzmrY2T4U2
	mCb5XZ6pkzrxnVFhQhF1bUn78sJUf0IsbL5K5+O/EQpiiuCetLDaeL60GK/ADtKd
	aDj9cy97M8ShFFjXGGWWu1Jcj5iF0eZr6xOZoDBJ8KOPDJkUs+zELlQm1qO+NTZq
	q8D18T6b0r6DYgJhA9wzSGVrPNbflwhjiZic2y1cBj/gT2ilQT/w4BMgG0E4y/Ef
	yUfFduegeoKGktBsKFRgXGtVrU3VY6QXs02x2s0JmUMNeiagBAWm8tqU594k35UT
	ocWNKc/XdNFoLAC2HrB60IpyWn3VjUDt+DihJtRR4A==
X-ME-Sender: <xms:N1j2ZS6yGIke2lgAQDIAgWn0d3o5xv8Bf4YinhTrMirDZT967-emKA>
    <xme:N1j2Zb5N9_0lYCnmk01pklQ2Fy7XultVhVADpCKSRsYw36rV47A9JfITbiSGSoO4r
    o8hlt5kpDGKyHhdSdw>
X-ME-Received: 
 <xmr:N1j2ZRcmrbjbTJeKG-IB8x_ZFYJRR2kGhIxTxgQpBGwx7aiHtDpkEtWU3g3DCZwICtfwFJ3rUlFet63CwPtpf_nE3C46rPNOiOar9pJCwvGrMg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrkeefgdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
    ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepffdvueelffevke
    duhfetjeduffeghfettdfguedtgfdvgfeufeduheevheevkeeknecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
    grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:N1j2ZfJNCYYGv3UtimkFVVrkz_Zei_Whtu4xwOVQ_T7jdtvGMU3VEQ>
    <xmx:N1j2ZWJgWWGOdAMnxkUppzoCZd_xqAihSBsiUx0Jg6fjD8QBG5zN1g>
    <xmx:N1j2ZQyy5Banbsoug8sjPjBOlti3Ot1qYJL3T4xTASlG3zvRQWOZiQ>
    <xmx:N1j2ZaIoBDWbTvarfp0G3jMqVNgSdy-MJrt1nBk3YFlz-Wk5ZIqRDg>
    <xmx:N1j2ZS3NdBPbo-2Fbtjnn2e4IkA_c-qAnKM_MpUolLvimd42WdR3Vw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Mar 2024 22:40:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: core: add kunitconfig
Date: Sun, 17 Mar 2024 11:40:50 +0900
Message-ID: <20240317024050.588370-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CDXATDOSPSQRY5725YV4VBLUT3Q7OTBI
X-Message-ID-Hash: CDXATDOSPSQRY5725YV4VBLUT3Q7OTBI
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CDXATDOSPSQRY5725YV4VBLUT3Q7OTBI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is helpful to add .kunitconfig if we work with the tools provided by
KUnit project. The file describes the series of kernel configurations to
satisfy the dependency to build the target test.

For example:

$ ./tools/testing/kunit/kunit.py run --arch=arm64 --cross_compile=aarch64-linux-gnu- --kunitconfig=sound/core/
[11:35:13] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=arm64 O=.kunit olddefconfig CROSS_COMPILE=aarch64-linux-gnu-
[11:35:19] Building KUnit Kernel ...
Populating config with:
$ make ARCH=arm64 O=.kunit olddefconfig CROSS_COMPILE=aarch64-linux-gnu-
Building with:
$ make ARCH=arm64 O=.kunit --jobs=8 CROSS_COMPILE=aarch64-linux-gnu-
[11:37:35] Starting KUnit Kernel (1/1)...
[11:37:35] ============================================================
Running tests with:
$ qemu-system-aarch64 -nodefaults -m 1024 -kernel .kunit/arch/arm64/boot/Image.gz -append 'kunit.enable=1 console=ttyAMA0 kunit_shutdown=reboot' -no-reboot -nographic -serial stdio -machine virt -cpu max,pauth-impdef=on
[11:37:35] ============== sound-core-test (10 subtests) ===============
[11:37:35] [PASSED] test_phys_format_size
[11:37:35] [PASSED] test_format_width
[11:37:35] [PASSED] test_format_endianness
[11:37:35] [PASSED] test_format_signed
[11:37:35] [PASSED] test_format_fill_silence
[11:37:35] [PASSED] test_playback_avail
[11:37:35] [PASSED] test_capture_avail
[11:37:35] [PASSED] test_card_set_id
[11:37:35] [PASSED] test_pcm_format_name
[11:37:35] [PASSED] test_card_add_component
[11:37:35] ================= [PASSED] sound-core-test =================
[11:37:35] ============================================================
[11:37:35] Testing complete. Ran 10 tests: passed: 10
[11:37:35] Elapsed time: 142.333s total, 5.617s configuring, 136.047s building, 0.630s running

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/core/.kunitconfig | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 sound/core/.kunitconfig

diff --git a/sound/core/.kunitconfig b/sound/core/.kunitconfig
new file mode 100644
index 000000000000..440f974ba0b7
--- /dev/null
+++ b/sound/core/.kunitconfig
@@ -0,0 +1,5 @@
+CONFIG_KUNIT=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_PCM=y
+CONFIG_SND_CORE_TEST=y
-- 
2.43.0

