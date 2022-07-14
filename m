Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE99957416F
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 04:28:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E2CB174D;
	Thu, 14 Jul 2022 04:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E2CB174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657765688;
	bh=WHy1InkYMG/gIWzcyPbjp/Qplg0qssY4TQDNvFBfRNY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q8sZMFKaUxA6Qtfke7h6u7eJKiEk4yJuYK1yY3E7mZ6AtOWLkn8xRlJ8veYwZzOLZ
	 tCKis/d+IKOL7ANKnMUpim6KwRCDthioA4RkGULwDweRbNoDCt2R+0VUSXdeB8j6/R
	 6MtFu0YVFVJtcanF5dh/xCKoE51kk9/5II3p/IPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF167F8014E;
	Thu, 14 Jul 2022 04:27:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FB95F80165; Thu, 14 Jul 2022 04:27:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43ADFF8014E
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 04:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43ADFF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i1nb7y/1"
Received: by mail-pj1-x102e.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso6774735pjc.1
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 19:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l1PDU52hqrz9TpIEoTCVpSFbII8lu6ItptcppdP7gxc=;
 b=i1nb7y/1DooSSSA98N+sVBpE2hJfyvtpesldzjObyEmBmatt0wTDI/K58LDkCmKjaF
 oohB+8WgNKh2bOWPfkmIHAWSiGya2qZX6Y2Nauxzswd6ZLee6Pwlij7/2rIBKbVwsp6B
 uNeQp1b/bxAZPoFYjFas3G2y9OYlqIQksRdSWmO06jkaI1Ced8GWWeGeH7ddwShRArHT
 k16iv6Z38fBG18ha1+G03ETJNGhKP4rLHM60herlM30K2qQeZSYIlv0/BqvX3j9KCZCN
 /I0Q5vctjQHgQAcOy3a8I+d9uHfRsciKV8Wql+0kG6YBqxp3py8bTbKBdzX/yjp09lCA
 IrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l1PDU52hqrz9TpIEoTCVpSFbII8lu6ItptcppdP7gxc=;
 b=Z9FncMBcbLAALWdzwNZlrncmH6zzKiVpf7H5v8B1WfbpVzji5OaIt3V8jhr9Hoqul/
 NZbrqhrCBXXxqPmXilxS65g9W4i+yfJ0i2H7YuNLxqOMqeXIl8IyLwgzVGBR9q57LgdP
 YYxpNLY+iLVHypFztEmhGqoCGyn273A3guyO+o/1XRddY8tw2jF7MF7tBbB523KrhCDr
 5F5bgpa8mSue3WUI6DWHvky0u8XEOWH2mEmEK7ZDzMWqon4+PmMrPPDHl4jspJqT2Gq8
 daC8GcxC2ZrgjRs0uQ8vHoogJkxz/Mi9Td3OtevaqWSsKMsFA/TaVFcLyEmnN3dP9b54
 9ptA==
X-Gm-Message-State: AJIora+AGudTawpFVrx7RV+DLDGjBxvWfMij7bjhK3kofKPNZ0ql95W/
 YrUCzephfVlDkcHFebHRxhc=
X-Google-Smtp-Source: AGRyM1tYy8kjgvfHUghIVF/joDdikn16auAx01HnbZHO4JRCTqLvCJuo5x9SQKqRFlJ2mvw62EdQVQ==
X-Received: by 2002:a17:90b:17c4:b0:1f0:4482:8efc with SMTP id
 me4-20020a17090b17c400b001f044828efcmr12947721pjb.207.1657765614301; 
 Wed, 13 Jul 2022 19:26:54 -0700 (PDT)
Received: from a-VirtualBox.. ([116.232.54.164])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a1709027b9500b0016be681f008sm108158pll.290.2022.07.13.19.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 19:26:53 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH 1/2] ASoC: codecs: add support for ES8326
Date: Thu, 14 Jul 2022 10:26:17 +0800
Message-Id: <20220714022617.6345-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <f88ec5f9-b46b-e72d-1fc3-668b834ed105@linux.intel.com>
References: <f88ec5f9-b46b-e72d-1fc3-668b834ed105@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, zhuning0077@gmail.com, tiwai@suse.com,
 broonie@kernel.org, zhuning@everest-semi.com, yangxiaohua@everest-semi.com
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

>> +             snd_soc_component_write(comp, ES8326_ADC1_SRC_2A, es8326->mic2_src);
>> +             snd_soc_component_write(comp, ES8326_ANA_MICBIAS_1B, 0x70);
>> +     } else if ((iface & ES8326_HPINSERT_FLAG) == ES8326_HPINSERT_FLAG) {
>
>> +
>> +static irqreturn_t es8326_irq(int irq, void *dev_id)
>> +{
>> +     struct es8326_priv *es8326 = dev_id;
>> +     struct snd_soc_component *comp = es8326->component;
>> +
>> +     snd_soc_component_write(comp, ES8326_ANA_MICBIAS_1B, 0x7c);
>
>this ES8326_ANA_MICBIAS_1B register is also modified in the workqueue,
>could this lead to invalid configurations?

In es8326_irq, MICBIAS is turned on to detect headphone from headset. When an unpluged
event is detected, MICBIAS is turned off to minimize pop noise. Maybe a comment/macro for this?

>> +     dev_dbg(comp->dev, "gpio flag %#04x", iface);
>> +     if ((iface & ES8326_HPINSERT_FLAG) == 0) {
>> +             dev_dbg(comp->dev, "No headset detected");
>> +             snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
>
>should you check if es8326->jack is set?
>in the 8316 driver you have a check for a spurious interrupt before
>set_jack() is called

I haven't seen other codecs (rt5640) handle spurious irq.

>it's rather odd that there's a resume but no suspend?

Since the codec loses power on suspend. It's also odd to write to the registers when they 
are going to be cleared during suspend. The lost registers need to be written during 
resume though. 
