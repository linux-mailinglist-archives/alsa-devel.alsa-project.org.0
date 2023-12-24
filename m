Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC1281DC23
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:32:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06DC2ED7;
	Sun, 24 Dec 2023 20:32:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06DC2ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446358;
	bh=3ER0xOvAhOw7UYm2k/9bUohO2rq9toqIhr0E69S5vrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LqlufvxGIAAViXz0WO74S4Up7efxmKGjh9VOlUKW60/fvnWvBkL+QflUIoUYCQi/g
	 oe5qkJCRIZOHHUa5dIQeSmhhV1lS7N0yT/iMz8hx4kqy1q6ESV5gjUsvuDyMvAtml/
	 8aoVXp79eyKwrEtzJLoOlbCBFrd8dyCCDVhSziTM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D8D8F80603; Sun, 24 Dec 2023 20:31:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C265F80601;
	Sun, 24 Dec 2023 20:31:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 966AEF805E8; Sun, 24 Dec 2023 20:31:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2806F8015B
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:30:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2806F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=uqDln1Hk
Received: by m.b4.vu (Postfix, from userid 1000)
	id 30575604B9CB; Mon, 25 Dec 2023 06:00:29 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 30575604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446229; bh=BpM0d/U+/XXah+AUVCKPlhYL60EcBOcx8sRcwlr1kRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uqDln1HkmWWH+11Sxda2WScABOtTqm0ycNN3wMffpXxjbbjuNNDJdHbBFDDnSkhAJ
	 aZ2k88NKoGdgQtxbzMgK8d8+WntsyisZDFTe5CdaY8eiISi4IbBowz9qLokhgpoT7c
	 h5V4x2eD7oFRkYKlt3lj2dGbRYYZi0WL9/x4yXVEF3lVbJAUpdTHcodYh/Ea9u1hGk
	 vuA+Cpca3CXrx1K27uHc5n00nqea857kojIOUbJACem7LxVr2Ct1wKVKtj4fFSF1Id
	 kpHZn/mV11Yu57YURjEtxrQEOysnUcuPA7AjTPMvDhzUG6xxftH2QeVGOBS2n/692v
	 oI3DYrGahWcdQ==
Date: Mon, 25 Dec 2023 06:00:29 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 20/23] ALSA: scarlett2: Add #define for SCARLETT2_MIX_MAX
Message-ID: <83cec5ccd75f0db2bd061a76d31a7023d26300c1.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: JNDGPRWHFZE5HNAZR6FQ2J5UAWOJKRLX
X-Message-ID-Hash: JNDGPRWHFZE5HNAZR6FQ2J5UAWOJKRLX
X-MailFrom: g@b4.vu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNDGPRWHFZE5HNAZR6FQ2J5UAWOJKRLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a #define for SCARLETT2_MIX_MAX (max of mixer inputs * outputs) as
that will be used again soon.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index efe95a25998b..186d6d04381c 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -208,6 +208,9 @@ static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
 /* Maximum number of outputs from the mixer */
 #define SCARLETT2_OUTPUT_MIX_MAX 12
 
+/* Maximum number of mixer gain controls */
+#define SCARLETT2_MIX_MAX (SCARLETT2_INPUT_MIX_MAX * SCARLETT2_OUTPUT_MIX_MAX)
+
 /* Maximum size of the data in the USB mux assignment message:
  * 20 inputs, 20 outputs, 25 matrix inputs, 12 spare
  */
@@ -719,7 +722,7 @@ struct scarlett2_data {
 	struct snd_kcontrol *speaker_switching_ctl;
 	struct snd_kcontrol *talkback_ctl;
 	u8 mux[SCARLETT2_MUX_MAX];
-	u8 mix[SCARLETT2_INPUT_MIX_MAX * SCARLETT2_OUTPUT_MIX_MAX];
+	u8 mix[SCARLETT2_MIX_MAX];
 };
 
 /*** Model-specific data ***/
-- 
2.43.0

