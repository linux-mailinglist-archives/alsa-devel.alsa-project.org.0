Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 506EF4387C0
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Oct 2021 11:03:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3554166B;
	Sun, 24 Oct 2021 11:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3554166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635066217;
	bh=UsYGPwyUR6rljrYgCshe8HFuD2dx3Qg+R04I/dhbySw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d49EhmYHWno5ImkBxtUAyOK1Yc7WDbK61PrH8kEPM761eBJ19YZKR1t8Ufvv85U76
	 dAMAdnk4kUrIIDLB8lyDZkFGUrXqllo3GDvdPs5rHRDa+4Tgn7JGjUKlyd5ei8K8y9
	 GZ6DjIY/fh4DLomoTsqsogX61wF93lnEwyDIdWyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D5F9F80086;
	Sun, 24 Oct 2021 11:02:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 994FDF80086; Sun, 24 Oct 2021 11:02:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A785F804F2
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 10:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A785F804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="E8CXmNf1"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1635065951; bh=UsYGPwyUR6rljrYgCshe8HFuD2dx3Qg+R04I/dhbySw=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=E8CXmNf1YxV4W+CCeqjsS/aSCk38mfI/ouTlHwbGFxnDL++ssXXDW1l4s2SYbfwZk
 2eFCnaaYEZDb0e5/Z35ex9KbZyXPayDJ6ogomovhdBc5lygsZG3MnbY2ZXwzsIzE95
 pYKdi1SlNlUX875MWzDIx+XqqjlaU5Omr8SN1IHU=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Sun, 24 Oct 2021 10:59:11 +0200 (CEST)
X-EA-Auth: UF79fHtwxkvAUPQnZA3RXBsFH51zrfZh1/aGmotlBjJFSYKRJjunb2Enxxg1c8Mg56Ky3elF6OU4RwGu8/zJDU0QKSztv8BXJ84nRto9aug=
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: stephan@gerhold.net, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v1 2/4] ASoC: codecs: tfa989x: Add support for tfa9897 RCV bit
Date: Sun, 24 Oct 2021 10:58:38 +0200
Message-Id: <20211024085840.1536438-3-vincent.knecht@mailoo.org>
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

TFA9897 has an internal 'rcv' switch so that it can manage both
loudspeaker and earpiece modes with the same physical speaker.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 sound/soc/codecs/tfa989x.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/codecs/tfa989x.c b/sound/soc/codecs/tfa989x.c
index 1ae47d4f1ca7..ada516acefc0 100644
--- a/sound/soc/codecs/tfa989x.c
+++ b/sound/soc/codecs/tfa989x.c
@@ -19,6 +19,7 @@
 #define TFA989X_REVISIONNUMBER		0x03
 #define TFA989X_REVISIONNUMBER_REV_MSK	GENMASK(7, 0)	/* device revision */
 #define TFA989X_I2SREG			0x04
+#define TFA989X_I2SREG_RCV		2	/* receiver mode */
 #define TFA989X_I2SREG_CHSA		6	/* amplifier input select */
 #define TFA989X_I2SREG_CHSA_MSK		GENMASK(7, 6)
 #define TFA989X_I2SREG_I2SSR		12	/* sample rate */
@@ -53,6 +54,7 @@ struct tfa989x_rev {
 };
 
 struct tfa989x {
+	const struct tfa989x_rev *rev;
 	struct regulator *vddd_supply;
 };
 
@@ -101,7 +103,25 @@ static const struct snd_soc_dapm_route tfa989x_dapm_routes[] = {
 	{"Amp Input", "Right", "AIFINR"},
 };
 
+static const char * const mode_text[] = { "Speaker", "Receiver" };
+static SOC_ENUM_SINGLE_DECL(mode_enum, TFA989X_I2SREG, TFA989X_I2SREG_RCV, mode_text);
+static const struct snd_kcontrol_new tfa989x_mode_controls[] = {
+	SOC_ENUM("Mode", mode_enum),
+};
+
+static int tfa989x_probe(struct snd_soc_component *component)
+{
+	struct tfa989x *tfa989x = snd_soc_component_get_drvdata(component);
+
+	if (tfa989x->rev->rev == TFA9897_REVISION)
+		return snd_soc_add_component_controls(component, tfa989x_mode_controls,
+						      ARRAY_SIZE(tfa989x_mode_controls));
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver tfa989x_component = {
+	.probe			= tfa989x_probe,
 	.dapm_widgets		= tfa989x_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(tfa989x_dapm_widgets),
 	.dapm_routes		= tfa989x_dapm_routes,
@@ -277,6 +297,7 @@ static int tfa989x_i2c_probe(struct i2c_client *i2c)
 	if (!tfa989x)
 		return -ENOMEM;
 
+	tfa989x->rev = rev;
 	i2c_set_clientdata(i2c, tfa989x);
 
 	tfa989x->vddd_supply = devm_regulator_get(dev, "vddd");
-- 
2.31.1



