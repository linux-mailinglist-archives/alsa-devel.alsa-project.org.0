Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7605D73B32D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 11:02:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AA22A4B;
	Fri, 23 Jun 2023 11:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AA22A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687510935;
	bh=9ZgG9vYOFr+vARs6V6C36fKG/bJXKs8A3MJLqbWigKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q+aeFmZRhZyyHCpuNuEFbMZblBZmP1C3Kd9/5SJGgMjGKzI4cKeB0nlXTvs/ZS6Tj
	 o9K4QWvL9/8NcPogzPQe2LFwd5HQBeL/1Vgaq0vz3fDrEqUaK/CW92SwpoOIMlxzBk
	 +ko7lwsPwt0R9Je9DJqK2Yl8EippIi2l8jvoqV3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CB8EF805E4; Fri, 23 Jun 2023 10:59:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21186F805D8;
	Fri, 23 Jun 2023 10:59:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAF87F805C2; Fri, 23 Jun 2023 10:59:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1260F8057A
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 10:59:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1260F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NFa8AHoK
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687510742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kVNcNG6lGwmhGkvgIcyEWY+MHma3vPNVL1G9SDQv0N4=;
	b=NFa8AHoKRE12t09DpcXaVFTI8PO3edG9JnWGegP3OkV+14qrVfmrQHlJ6NJ+TpuxwzLVA6
	f7KT4l3NLQeVGnpM0/hpHFDZ5njd6Osa68j78+2RbRhMTCmyWII/7X2ikwdlZnWMgg/2QC
	Nzbb0+JPJkXRxh9TBkhI2sioMXEF+sW7V9Rv9rbndl32ZkTPda4l6ghWVmd4pP/uZCFfr8
	K8aQJgJ3hgvnrESCgsgDcJ4I0Rdzaj6GwviIUsjbyhP5W7CQRjOfwBKhcGRq0c8BtO9ia5
	MT4SCCM0IzJ22na3KD7kOfn8AkKoc1LGUc2R4z+DPoGFuJpP4o7cdEsf3DdOOQ==
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id A2F02E0008;
	Fri, 23 Jun 2023 08:59:00 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Wojciech Ziemba <wojciech.ziemba@intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v6 11/13] ASoC: soc-dapm.h: Convert macros to return a
 compound literal
Date: Fri, 23 Jun 2023 10:58:28 +0200
Message-Id: <20230623085830.749991-12-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230623085830.749991-1-herve.codina@bootlin.com>
References: <20230623085830.749991-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QOYDCJPBVIANPLGHIJ7FY5TPAYZWFDZS
X-Message-ID-Hash: QOYDCJPBVIANPLGHIJ7FY5TPAYZWFDZS
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QOYDCJPBVIANPLGHIJ7FY5TPAYZWFDZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SND_SOC_DAPM_* helpers family are used to build widgets array in a
static way.

Convert them to return a compound literal in order to use them in both
static and dynamic way.
With this conversion, the different SND_SOC_DAPM_* parameters can be
computed by the code and the widget can be built based on this parameter
computation.
  static int create_widget(char *input_name)
  {
          struct snd_soc_dapm_widget widget;
          char name*;
          ...
          name = input_name;
          if (!name)
                  name = "default";

          widget = SND_SOC_DAPM_INPUT(name);
          ...
  }

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 include/sound/soc-dapm.h | 138 ++++++++++++++++++++++++++-------------
 1 file changed, 92 insertions(+), 46 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 87f8e1793af1..2e38dff16779 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -42,36 +42,45 @@ struct soc_enum;
 
 /* codec domain */
 #define SND_SOC_DAPM_VMID(wname) \
-{	.id = snd_soc_dapm_vmid, .name = wname, .kcontrol_news = NULL, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_vmid, .name = wname, .kcontrol_news = NULL, \
 	.num_kcontrols = 0}
 
 /* platform domain */
 #define SND_SOC_DAPM_SIGGEN(wname) \
-{	.id = snd_soc_dapm_siggen, .name = wname, .kcontrol_news = NULL, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_siggen, .name = wname, .kcontrol_news = NULL, \
 	.num_kcontrols = 0, .reg = SND_SOC_NOPM }
 #define SND_SOC_DAPM_SINK(wname) \
-{	.id = snd_soc_dapm_sink, .name = wname, .kcontrol_news = NULL, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_sink, .name = wname, .kcontrol_news = NULL, \
 	.num_kcontrols = 0, .reg = SND_SOC_NOPM }
 #define SND_SOC_DAPM_INPUT(wname) \
-{	.id = snd_soc_dapm_input, .name = wname, .kcontrol_news = NULL, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_input, .name = wname, .kcontrol_news = NULL, \
 	.num_kcontrols = 0, .reg = SND_SOC_NOPM }
 #define SND_SOC_DAPM_OUTPUT(wname) \
-{	.id = snd_soc_dapm_output, .name = wname, .kcontrol_news = NULL, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_output, .name = wname, .kcontrol_news = NULL, \
 	.num_kcontrols = 0, .reg = SND_SOC_NOPM }
 #define SND_SOC_DAPM_MIC(wname, wevent) \
-{	.id = snd_soc_dapm_mic, .name = wname, .kcontrol_news = NULL, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_mic, .name = wname, .kcontrol_news = NULL, \
 	.num_kcontrols = 0, .reg = SND_SOC_NOPM, .event = wevent, \
 	.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD}
 #define SND_SOC_DAPM_HP(wname, wevent) \
-{	.id = snd_soc_dapm_hp, .name = wname, .kcontrol_news = NULL, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_hp, .name = wname, .kcontrol_news = NULL, \
 	.num_kcontrols = 0, .reg = SND_SOC_NOPM, .event = wevent, \
 	.event_flags = SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD}
 #define SND_SOC_DAPM_SPK(wname, wevent) \
-{	.id = snd_soc_dapm_spk, .name = wname, .kcontrol_news = NULL, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_spk, .name = wname, .kcontrol_news = NULL, \
 	.num_kcontrols = 0, .reg = SND_SOC_NOPM, .event = wevent, \
 	.event_flags = SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD}
 #define SND_SOC_DAPM_LINE(wname, wevent) \
-{	.id = snd_soc_dapm_line, .name = wname, .kcontrol_news = NULL, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_line, .name = wname, .kcontrol_news = NULL, \
 	.num_kcontrols = 0, .reg = SND_SOC_NOPM, .event = wevent, \
 	.event_flags = SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD}
 
@@ -82,93 +91,110 @@ struct soc_enum;
 /* path domain */
 #define SND_SOC_DAPM_PGA(wname, wreg, wshift, winvert,\
 	 wcontrols, wncontrols) \
-{	.id = snd_soc_dapm_pga, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_pga, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = wncontrols}
 #define SND_SOC_DAPM_OUT_DRV(wname, wreg, wshift, winvert,\
 	 wcontrols, wncontrols) \
-{	.id = snd_soc_dapm_out_drv, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_out_drv, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = wncontrols}
 #define SND_SOC_DAPM_MIXER(wname, wreg, wshift, winvert, \
 	 wcontrols, wncontrols)\
-{	.id = snd_soc_dapm_mixer, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_mixer, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = wncontrols}
 #define SND_SOC_DAPM_MIXER_NAMED_CTL(wname, wreg, wshift, winvert, \
 	 wcontrols, wncontrols)\
-{       .id = snd_soc_dapm_mixer_named_ctl, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_mixer_named_ctl, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = wncontrols}
 /* DEPRECATED: use SND_SOC_DAPM_SUPPLY */
 #define SND_SOC_DAPM_MICBIAS(wname, wreg, wshift, winvert) \
-{	.id = snd_soc_dapm_micbias, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_micbias, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = NULL, .num_kcontrols = 0}
 #define SND_SOC_DAPM_SWITCH(wname, wreg, wshift, winvert, wcontrols) \
-{	.id = snd_soc_dapm_switch, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_switch, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = 1}
 #define SND_SOC_DAPM_MUX(wname, wreg, wshift, winvert, wcontrols) \
-{	.id = snd_soc_dapm_mux, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_mux, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = 1}
 #define SND_SOC_DAPM_DEMUX(wname, wreg, wshift, winvert, wcontrols) \
-{	.id = snd_soc_dapm_demux, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_demux, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = 1}
 
 /* Simplified versions of above macros, assuming wncontrols = ARRAY_SIZE(wcontrols) */
 #define SOC_PGA_ARRAY(wname, wreg, wshift, winvert,\
 	 wcontrols) \
-{	.id = snd_soc_dapm_pga, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_pga, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = ARRAY_SIZE(wcontrols)}
 #define SOC_MIXER_ARRAY(wname, wreg, wshift, winvert, \
 	 wcontrols)\
-{	.id = snd_soc_dapm_mixer, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_mixer, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = ARRAY_SIZE(wcontrols)}
 #define SOC_MIXER_NAMED_CTL_ARRAY(wname, wreg, wshift, winvert, \
 	 wcontrols)\
-{       .id = snd_soc_dapm_mixer_named_ctl, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_mixer_named_ctl, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = ARRAY_SIZE(wcontrols)}
 
 /* path domain with event - event handler must return 0 for success */
 #define SND_SOC_DAPM_PGA_E(wname, wreg, wshift, winvert, wcontrols, \
 	wncontrols, wevent, wflags) \
-{	.id = snd_soc_dapm_pga, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_pga, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = wncontrols, \
 	.event = wevent, .event_flags = wflags}
 #define SND_SOC_DAPM_OUT_DRV_E(wname, wreg, wshift, winvert, wcontrols, \
 	wncontrols, wevent, wflags) \
-{	.id = snd_soc_dapm_out_drv, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_out_drv, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = wncontrols, \
 	.event = wevent, .event_flags = wflags}
 #define SND_SOC_DAPM_MIXER_E(wname, wreg, wshift, winvert, wcontrols, \
 	wncontrols, wevent, wflags) \
-{	.id = snd_soc_dapm_mixer, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_mixer, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = wncontrols, \
 	.event = wevent, .event_flags = wflags}
 #define SND_SOC_DAPM_MIXER_NAMED_CTL_E(wname, wreg, wshift, winvert, \
 	wcontrols, wncontrols, wevent, wflags) \
-{       .id = snd_soc_dapm_mixer, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_mixer, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, \
 	.num_kcontrols = wncontrols, .event = wevent, .event_flags = wflags}
 #define SND_SOC_DAPM_SWITCH_E(wname, wreg, wshift, winvert, wcontrols, \
 	wevent, wflags) \
-{	.id = snd_soc_dapm_switch, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_switch, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = 1, \
 	.event = wevent, .event_flags = wflags}
 #define SND_SOC_DAPM_MUX_E(wname, wreg, wshift, winvert, wcontrols, \
 	wevent, wflags) \
-{	.id = snd_soc_dapm_mux, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_mux, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = 1, \
 	.event = wevent, .event_flags = wflags}
@@ -176,101 +202,121 @@ struct soc_enum;
 /* additional sequencing control within an event type */
 #define SND_SOC_DAPM_PGA_S(wname, wsubseq, wreg, wshift, winvert, \
 	wevent, wflags) \
-{	.id = snd_soc_dapm_pga, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_pga, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.event = wevent, .event_flags = wflags, \
 	.subseq = wsubseq}
 #define SND_SOC_DAPM_SUPPLY_S(wname, wsubseq, wreg, wshift, winvert, wevent, \
 	wflags)	\
-{	.id = snd_soc_dapm_supply, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_supply, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.event = wevent, .event_flags = wflags, .subseq = wsubseq}
 
 /* Simplified versions of above macros, assuming wncontrols = ARRAY_SIZE(wcontrols) */
 #define SOC_PGA_E_ARRAY(wname, wreg, wshift, winvert, wcontrols, \
 	wevent, wflags) \
-{	.id = snd_soc_dapm_pga, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_pga, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = ARRAY_SIZE(wcontrols), \
 	.event = wevent, .event_flags = wflags}
 #define SOC_MIXER_E_ARRAY(wname, wreg, wshift, winvert, wcontrols, \
 	wevent, wflags) \
-{	.id = snd_soc_dapm_mixer, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_mixer, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = ARRAY_SIZE(wcontrols), \
 	.event = wevent, .event_flags = wflags}
 #define SOC_MIXER_NAMED_CTL_E_ARRAY(wname, wreg, wshift, winvert, \
 	wcontrols, wevent, wflags) \
-{       .id = snd_soc_dapm_mixer, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_mixer, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.kcontrol_news = wcontrols, .num_kcontrols = ARRAY_SIZE(wcontrols), \
 	.event = wevent, .event_flags = wflags}
 
 /* events that are pre and post DAPM */
 #define SND_SOC_DAPM_PRE(wname, wevent) \
-{	.id = snd_soc_dapm_pre, .name = wname, .kcontrol_news = NULL, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_pre, .name = wname, .kcontrol_news = NULL, \
 	.num_kcontrols = 0, .reg = SND_SOC_NOPM, .event = wevent, \
 	.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD}
 #define SND_SOC_DAPM_POST(wname, wevent) \
-{	.id = snd_soc_dapm_post, .name = wname, .kcontrol_news = NULL, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_post, .name = wname, .kcontrol_news = NULL, \
 	.num_kcontrols = 0, .reg = SND_SOC_NOPM, .event = wevent, \
 	.event_flags = SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD}
 
 /* stream domain */
 #define SND_SOC_DAPM_AIF_IN(wname, stname, wchan, wreg, wshift, winvert) \
-{	.id = snd_soc_dapm_aif_in, .name = wname, .sname = stname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_aif_in, .name = wname, .sname = stname, \
 	.channel = wchan, SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), }
 #define SND_SOC_DAPM_AIF_IN_E(wname, stname, wchan, wreg, wshift, winvert, \
 			      wevent, wflags)				\
-{	.id = snd_soc_dapm_aif_in, .name = wname, .sname = stname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_aif_in, .name = wname, .sname = stname, \
 	.channel = wchan, SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.event = wevent, .event_flags = wflags }
 #define SND_SOC_DAPM_AIF_OUT(wname, stname, wchan, wreg, wshift, winvert) \
-{	.id = snd_soc_dapm_aif_out, .name = wname, .sname = stname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_aif_out, .name = wname, .sname = stname, \
 	.channel = wchan, SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), }
 #define SND_SOC_DAPM_AIF_OUT_E(wname, stname, wchan, wreg, wshift, winvert, \
 			     wevent, wflags)				\
-{	.id = snd_soc_dapm_aif_out, .name = wname, .sname = stname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_aif_out, .name = wname, .sname = stname, \
 	.channel = wchan, SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.event = wevent, .event_flags = wflags }
 #define SND_SOC_DAPM_DAC(wname, stname, wreg, wshift, winvert) \
-{	.id = snd_soc_dapm_dac, .name = wname, .sname = stname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_dac, .name = wname, .sname = stname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert) }
 #define SND_SOC_DAPM_DAC_E(wname, stname, wreg, wshift, winvert, \
 			   wevent, wflags)				\
-{	.id = snd_soc_dapm_dac, .name = wname, .sname = stname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_dac, .name = wname, .sname = stname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.event = wevent, .event_flags = wflags}
 
 #define SND_SOC_DAPM_ADC(wname, stname, wreg, wshift, winvert) \
-{	.id = snd_soc_dapm_adc, .name = wname, .sname = stname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_adc, .name = wname, .sname = stname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), }
 #define SND_SOC_DAPM_ADC_E(wname, stname, wreg, wshift, winvert, \
 			   wevent, wflags)				\
-{	.id = snd_soc_dapm_adc, .name = wname, .sname = stname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_adc, .name = wname, .sname = stname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.event = wevent, .event_flags = wflags}
 #define SND_SOC_DAPM_CLOCK_SUPPLY(wname) \
-{	.id = snd_soc_dapm_clock_supply, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_clock_supply, .name = wname, \
 	.reg = SND_SOC_NOPM, .event = dapm_clock_event, \
 	.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD }
 
 /* generic widgets */
 #define SND_SOC_DAPM_REG(wid, wname, wreg, wshift, wmask, won_val, woff_val) \
-{	.id = wid, .name = wname, .kcontrol_news = NULL, .num_kcontrols = 0, \
+(struct snd_soc_dapm_widget) { \
+	.id = wid, .name = wname, .kcontrol_news = NULL, .num_kcontrols = 0, \
 	.reg = wreg, .shift = wshift, .mask = wmask, \
 	.on_val = won_val, .off_val = woff_val, }
 #define SND_SOC_DAPM_SUPPLY(wname, wreg, wshift, winvert, wevent, wflags) \
-{	.id = snd_soc_dapm_supply, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_supply, .name = wname, \
 	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
 	.event = wevent, .event_flags = wflags}
 #define SND_SOC_DAPM_REGULATOR_SUPPLY(wname, wdelay, wflags)	    \
-{	.id = snd_soc_dapm_regulator_supply, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_regulator_supply, .name = wname, \
 	.reg = SND_SOC_NOPM, .shift = wdelay, .event = dapm_regulator_event, \
 	.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD, \
 	.on_val = wflags}
 #define SND_SOC_DAPM_PINCTRL(wname, active, sleep) \
-{	.id = snd_soc_dapm_pinctrl, .name = wname, \
+(struct snd_soc_dapm_widget) { \
+	.id = snd_soc_dapm_pinctrl, .name = wname, \
 	.priv = (&(struct snd_soc_dapm_pinctrl_priv) \
 		{ .active_state = active, .sleep_state = sleep,}), \
 	.reg = SND_SOC_NOPM, .event = dapm_pinctrl_event, \
-- 
2.40.1

