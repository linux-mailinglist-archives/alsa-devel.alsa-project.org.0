Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01C8812EF
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:06:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89E092BBF;
	Wed, 20 Mar 2024 15:06:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89E092BBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943618;
	bh=bOLF7fcS5ACPldXaBD568NJeMzeDNYdUQgRd4vrKBHY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aArlaBXFJdL6cHvokDtkh8ktpvuTG3szMaeZkIIf68Pio7NXSkeOLAOrGUeOv2tZ7
	 fYDf5a3S0kJY4POOoi9W0d1EiXHfvuj4+7oncC2lHfHBDojUJWcq6DQ0kiF2YwSo+F
	 9TPaguL6MqshlFqUXk+bLGIZx9MPi5QLNwlO30NQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41D8EF89760; Wed, 20 Mar 2024 15:00:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AC06F89773;
	Wed, 20 Mar 2024 15:00:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70A3CF804E7; Wed, 20 Mar 2024 09:30:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail78-50.sinamail.sina.com.cn (mail78-50.sinamail.sina.com.cn
 [219.142.78.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E1E9F8010B
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 09:29:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E1E9F8010B
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.232.53.71])
	by sina.net (10.75.30.234) with ESMTP
	id 65FA9E7300035E88; Wed, 20 Mar 2024 16:29:40 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: E7EBBB93BA4B4DA4B16C6CD39AD83E9D
X-SMAIL-UIID: E7EBBB93BA4B4DA4B16C6CD39AD83E9D-20240320-162940
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH 1/2] ASoC: codecs: ES8326: Reducing power consumption
Date: Wed, 20 Mar 2024 16:29:39 +0800
Message-Id: <20240320082939.4231-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CBQX7U7WF3CVOGSU3NNS4YLJXHUIS7JN
X-Message-ID-Hash: CBQX7U7WF3CVOGSU3NNS4YLJXHUIS7JN
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:59:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CBQX7U7WF3CVOGSU3NNS4YLJXHUIS7JN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > For lower power consumption during hibernation, the configuration of
> > es8326_suspend and es8326_remove will be adjusted.
> > Adding es8326_i2c_shutdown and es8326_i2c_remove to cover different
> > situations
> >
> > Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> > ---
> > sound/soc/codecs/es8326.c | 34 +++++++++++++++++++++++++++++++++-
> > 1 file changed, 33 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
> > index 15289dadafea..5c89323035a2 100755
> > --- a/sound/soc/codecs/es8326.c
> > +++ b/sound/soc/codecs/es8326.c
> > @@ -1072,12 +1072,13 @@ static int es8326_suspend(struct snd_soc_component *component)
> > es8326->calibrated = false;
> > regmap_write(es8326->regmap, ES8326_CLK_CTL, ES8326_CLK_OFF);
> > regcache_cache_only(es8326->regmap, true);
> > - regcache_mark_dirty(es8326->regmap);
> >
> > /* reset register value to default */
> > regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
> > usleep_range(1000, 3000);
> > regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);
> > +
> > + regcache_mark_dirty(es8326->regmap);
> > return 0;
> > }
> >
> > @@ -1163,8 +1164,13 @@ static int es8326_set_jack(struct snd_soc_component *component,
> >
> > static void es8326_remove(struct snd_soc_component *component)
> > {
> > + struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
> > +
> > es8326_disable_jack_detect(component);
> > es8326_set_bias_level(component, SND_SOC_BIAS_OFF);
> > + regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
> > + usleep_range(1000, 3000);
> > + regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);
> > }
> >
> > static const struct snd_soc_component_driver soc_component_dev_es8326 = {
> > @@ -1236,6 +1242,30 @@ static int es8326_i2c_probe(struct i2c_client *i2c)
> > &es8326_dai, 1);
> > }
> >
> > +
> > +static void es8326_i2c_shutdown(struct i2c_client *i2c)
> > +{
> > + struct snd_soc_component *component;
> > + struct es8326_priv *es8326;
> > +
> > + dev_dbg(component->dev, "Enter into %s\n", __func__);
> Above line works on unset pointer, you need to set component before
> dereferencing it.
> > + es8326 = i2c_get_clientdata(i2c);
> > + component = es8326->component;
> > + cancel_delayed_work_sync(&es8326->jack_detect_work);
> > + cancel_delayed_work_sync(&es8326->button_press_work);
> > +
> > + regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
> > + usleep_range(1000, 3000);
> > + regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);
> > +
> > + return;
> > +}
> > +
> > +static void es8326_i2c_remove(struct i2c_client *i2c)
> > +{
> > + es8326_i2c_shutdown(i2c);
> > +}
> > +
> > static const struct i2c_device_id es8326_i2c_id[] = {
> > {"es8326", 0 },
> > {}
> > @@ -1265,6 +1295,8 @@ static struct i2c_driver es8326_i2c_driver = {
> > .of_match_table = of_match_ptr(es8326_of_match),
> > },
> > .probe = es8326_i2c_probe,
> > + .shutdown = es8326_i2c_shutdown,
> > + .remove = es8326_i2c_remove,
> > .id_table = es8326_i2c_id,
> > };
> > module_i2c_driver(es8326_i2c_driver);

I'm sorry. I'll fix my mistake.
