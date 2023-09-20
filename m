Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 480BE7A94B6
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:24:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93E36E0D;
	Thu, 21 Sep 2023 15:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93E36E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302672;
	bh=3RqFZkD8YA4uhVjWcjXMVAfipQ+XsjLHPc3ZcEQ6Ink=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lbKH6I48MeSx1bPbWjxB70InfBq3aQ16jWdNdmb1G0K6JeIKZi1LcdQ5JAHztLLnf
	 lyfCFhIrN4Kq7F/MsysBlEr1CAxZK5zK4FJh2jZeaEslqA01kfvqzaJd4enCZJyCFc
	 5EoHX2nHqDPbrXUW2hktkbGSNzfnOwvmJPpTi2tg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 753E6F805C5; Thu, 21 Sep 2023 15:22:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31335F805C1;
	Thu, 21 Sep 2023 15:22:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C0BEF8025A; Wed, 20 Sep 2023 05:44:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id 564C9F80125
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 05:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 564C9F80125
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1978089:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Wed, 20 Sep 2023 11:43:19 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Wed, 20 Sep
 2023 11:43:19 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Wed, 20 Sep 2023 11:43:19 +0800
Date: Wed, 20 Sep 2023 11:43:19 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Allen Lin
	<allen_lin@richtek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] ASoC: codecs: Add Richtek rtq9128audio amplifier
 support
Message-ID: <20230920034319.GA4446@linuxcarl2.richtek.com>
References: <1695086301-10376-1-git-send-email-cy_huang@richtek.com>
 <1695086301-10376-3-git-send-email-cy_huang@richtek.com>
 <eae67380-4eb5-b5b2-d010-ce1f80bc91f9@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eae67380-4eb5-b5b2-d010-ce1f80bc91f9@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MailFrom: prvs=16244D1BD6=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RY5H74RJ4KWYULQEN6JKZNT7KKDKHUCG
X-Message-ID-Hash: RY5H74RJ4KWYULQEN6JKZNT7KKDKHUCG
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:22:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RY5H74RJ4KWYULQEN6JKZNT7KKDKHUCG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 19, 2023 at 08:42:29AM -0400, Pierre-Louis Bossart wrote:
> 
> > +static int rtq9128_i2c_write(void *context, const void *data, size_t count)
> > +{
> > +	struct device *dev = context;
> > +	struct i2c_client *i2c = to_i2c_client(dev);
> > +	u8 reg = *(u8 *)data;
> > +	int rg_size;
> > +
> > +	BUG_ON(count != 5);
> 
> is this really necessary? Just log and error and return?
> same comments for other functions
>
Yap, it can be removed. Originally, just use it to check regmap core really
follow the declared regmap config.

I think this check may still needed. I'll change the BUG_ON to if/err/return
following by your suggestion in v3.
> > +	rg_size = rtq9128_get_reg_size(reg);
> > +	return i2c_smbus_write_i2c_block_data(i2c, reg, rg_size, data + count - rg_size);
> > +}
> 
