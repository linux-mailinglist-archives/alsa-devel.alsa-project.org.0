Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 908234387BA
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Oct 2021 11:00:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E735D166B;
	Sun, 24 Oct 2021 10:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E735D166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635066045;
	bh=/ypa2kU25/kKnTZCdL90F0H4ic02JIr43Lis4n0Ge7M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ecLTePTedzSIYjhsIcBcEPOqZPSrkOu9yFYTkoylujDflyRRYXeqGakI4bEvksWf6
	 fXAJ64dy3F/7p+tajI8Ljzq9Tbs+l8YcDPrL4nGVH0JAa0ao6v14qonkJL1SpIxRsn
	 3AwlH45wjPyhM3gii6mevemUVbN8oLHjLspgN9Gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EB14F802C8;
	Sun, 24 Oct 2021 10:59:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE0C4F80300; Sun, 24 Oct 2021 10:59:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from msg-4.mailo.com (ip-15.mailobj.net [213.182.54.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72649F80269
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 10:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72649F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="cqEFyluH"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1635065951; bh=/ypa2kU25/kKnTZCdL90F0H4ic02JIr43Lis4n0Ge7M=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=cqEFyluHUoJwbAefGCQvBcutpZbw13F6Bkou7FK3qGiTgoOEKN4M118GqEl8MOg0h
 NSFjmzVYsyFP0KonaTwCAEUMDj5oPz9qHwbiKgHk9BorpNdvyeoWqA05Zfz8c5V9TD
 SjONuUZERgmgaY3Jd693xRM6AJ7sXToaCLQiSZXg=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Sun, 24 Oct 2021 10:59:11 +0200 (CEST)
X-EA-Auth: 3Wq8fnNOPO+2BI21khWtdZJk+3txfy7SD9qhVZ/8UPzQ2r8hT4j0csvyxAngR7k1uM46XR0phM3Ozi6LXVmtNjTWeznwf2Qj0usfYgvXOyQ=
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: stephan@gerhold.net, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v1 1/4] ASoC: codecs: tfa989x: Add switch to allow disabling
 amplifier
Date: Sun, 24 Oct 2021 10:58:37 +0200
Message-Id: <20211024085840.1536438-2-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211024085840.1536438-1-vincent.knecht@mailoo.org>
References: <20211024085840.1536438-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Vincent Knecht <vincent.knecht@mailoo.org>, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Stephan Gerhold <stephan@gerhold.net>

In some configurations it may be necessary to explicitly disable
the amplifier with an ALSA mixer. An example for this is a stereo
setup with two TFA989X. If only one of them should be used (e.g.
to use it as an earpiece) the other one must be explicitly disabled.

Add a virtual "Amp Switch" to implement that. There is no register
for this (SND_SOC_NOPM) so it only prevents DAPM from activating
the amplifier. Also it is inverted (= enabled by default) for
compatibility with devices that do not need this functionality.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 sound/soc/codecs/tfa989x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tfa989x.c b/sound/soc/codecs/tfa989x.c
index 643b45188b6f..1ae47d4f1ca7 100644
--- a/sound/soc/codecs/tfa989x.c
+++ b/sound/soc/codecs/tfa989x.c
@@ -77,13 +77,16 @@ static const struct regmap_config tfa989x_regmap = {
 
 static const char * const chsa_text[] = { "Left", "Right", /* "DSP" */ };
 static SOC_ENUM_SINGLE_DECL(chsa_enum, TFA989X_I2SREG, TFA989X_I2SREG_CHSA, chsa_text);
-static const struct snd_kcontrol_new chsa_mux = SOC_DAPM_ENUM("Amp Input", chsa_enum);
+static const struct snd_kcontrol_new
+	chsa_mux = SOC_DAPM_ENUM("Amp Input", chsa_enum),
+	amp_switch = SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 1);
 
 static const struct snd_soc_dapm_widget tfa989x_dapm_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("OUT"),
 	SND_SOC_DAPM_SUPPLY("POWER", TFA989X_SYS_CTRL, TFA989X_SYS_CTRL_PWDN, 1, NULL, 0),
 	SND_SOC_DAPM_OUT_DRV("AMPE", TFA989X_SYS_CTRL, TFA989X_SYS_CTRL_AMPE, 0, NULL, 0),
 
+	SND_SOC_DAPM_SWITCH("Amp", SND_SOC_NOPM, 0, 0, &amp_switch),
 	SND_SOC_DAPM_MUX("Amp Input", SND_SOC_NOPM, 0, 0, &chsa_mux),
 	SND_SOC_DAPM_AIF_IN("AIFINL", "HiFi Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("AIFINR", "HiFi Playback", 1, SND_SOC_NOPM, 0, 0),
@@ -92,7 +95,8 @@ static const struct snd_soc_dapm_widget tfa989x_dapm_widgets[] = {
 static const struct snd_soc_dapm_route tfa989x_dapm_routes[] = {
 	{"OUT", NULL, "AMPE"},
 	{"AMPE", NULL, "POWER"},
-	{"AMPE", NULL, "Amp Input"},
+	{"AMPE", NULL, "Amp"},
+	{"Amp", "Switch", "Amp Input"},
 	{"Amp Input", "Left", "AIFINL"},
 	{"Amp Input", "Right", "AIFINR"},
 };
-- 
2.31.1



