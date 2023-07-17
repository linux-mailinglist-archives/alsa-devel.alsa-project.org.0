Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0196D7563C5
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 15:04:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24C66850;
	Mon, 17 Jul 2023 15:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24C66850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689599093;
	bh=DvbwTSrDoCqucUzTMhMo9HotXj7Skh2rK5XJK2AnCcg=;
	h=Date:From:Cc:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ij5jSVPHLHH1GA8NdKUr1g4BicTKYrBxAbjaRSBLSK1HDYLT1R9FjmAXB8Mj4VfAY
	 5+/lZKg2lCoammHVydRON09mY5+cSMMxzIzaEPE9QUa8UVs5mFaJTQhaX+OuOTSksE
	 uLjfSVoo7vilWl6Un6A8nXi2A0Ov23eUjumE2Nsw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90862F8047D; Mon, 17 Jul 2023 15:04:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72FD6F8032D;
	Mon, 17 Jul 2023 15:04:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFA68F8047D; Mon, 17 Jul 2023 15:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EF94F800D2
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 15:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EF94F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cS0kE+gt
Received: by mail.gandi.net (Postfix) with ESMTPSA id E222A240007;
	Mon, 17 Jul 2023 13:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689599033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xFeGyiq0O4aqT1RUTL56PF+dTsP0yAysyKq2Bq6RFK4=;
	b=cS0kE+gtPXUZbb8K7Nu1gitcwIb6Pi9bf5JoKFGRrIJTtw9e/YFBjZISfZLgiXM/CovQeA
	bb8IJGJgqyZuC9I7xVEF1sQG6e4YFSwp8GSpTRg8KX7bowLLh9rCUFbyp9ZZpCW9Sw/jVR
	dYM4cFH/bI9TVl5RJFVnNKkMvXZhfFfH6iAlL1RNQNIkyla6Z7DZZsVxXhDS2KEI0XJl2a
	soutzWQACYIHJ/enPaSNhmmx5Mz7W6ziViz1BYP0xKw6fM1psf22brvmnzrmkpvCLfDj/4
	by7RaqWLBgEHRvYlX773BTuFMEDJfqQYCkf5/Td1fOsULThYpxgsYwnoJYoFJg==
Date: Mon, 17 Jul 2023 15:03:51 +0200
From: Herve Codina <herve.codina@bootlin.com>
Cc: shumingf@realtek.com, flatmax@flatmax.com,
 ckeepax@opensource.cirrus.com, doug@schmorgal.com, fido_max@inbox.ru,
 pierre-louis.bossart@linux.intel.com, kiseok.jo@irondevice.com,
 liweilei@awinic.com, colin.i.king@gmail.com, trix@redhat.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, yijiangtao@awinic.com,
 zhangjianming@awinic.com
Subject: Re: [PATCH V1 0/5]  ASoC: codecs: Add Awinic AW88261 audio
 amplifier driver
Message-ID: <20230717145456.5afee0cf@bootlin.com>
In-Reply-To: <20230717115845.297991-1-wangweidong.a@awinic.com>
References: <20230717115845.297991-1-wangweidong.a@awinic.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: 4GQ652LEIUCNJD2ZGFUSYIYKT47Y2PNP
X-Message-ID-Hash: 4GQ652LEIUCNJD2ZGFUSYIYKT47Y2PNP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GQ652LEIUCNJD2ZGFUSYIYKT47Y2PNP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Weidong,

On Mon, 17 Jul 2023 19:58:40 +0800
wangweidong.a@awinic.com wrote:

> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> The AW88261 is an I2S/TDM input, high efficiency
> digital Smart K audio amplifier with an integrated 10.25V
> smart boost convert
> 
> Add a DT schema for describing Awinic aw88261 audio amplifiers. They are
> controlled using I2C.
> 
> Weidong Wang (5):
>   ASoC: codecs: Add i2c and codec registration for aw88261 and their
>     associated operation functions
>   ASoC: codecs: aw88261 function for ALSA Audio Driver
>   ASoC: codecs: ACF bin parsing and check library file for aw88261
>   ASoC: codecs: aw88261 chip register file, data type file and Kconfig
>     Makefile
>   ASoC: dt-bindings: Add schema for "awinic,aw88261"
> 
>  .../bindings/sound/awinic,aw88261.yaml        |  53 +
>  sound/soc/codecs/Kconfig                      |  17 +
>  sound/soc/codecs/Makefile                     |   5 +
>  sound/soc/codecs/aw88261/aw88261.c            | 539 ++++++++++
>  sound/soc/codecs/aw88261/aw88261.h            |  52 +
>  sound/soc/codecs/aw88261/aw88261_data_type.h  | 144 +++
>  sound/soc/codecs/aw88261/aw88261_device.c     | 959 +++++++++++++++++
>  sound/soc/codecs/aw88261/aw88261_device.h     | 114 ++
>  sound/soc/codecs/aw88261/aw88261_lib.c        | 997 ++++++++++++++++++
>  sound/soc/codecs/aw88261/aw88261_lib.h        |  91 ++
>  sound/soc/codecs/aw88261/aw88261_reg.h        | 377 +++++++
>  11 files changed, 3348 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw88261.yaml
>  create mode 100644 sound/soc/codecs/aw88261/aw88261.c
>  create mode 100644 sound/soc/codecs/aw88261/aw88261.h
>  create mode 100644 sound/soc/codecs/aw88261/aw88261_data_type.h
>  create mode 100644 sound/soc/codecs/aw88261/aw88261_device.c
>  create mode 100644 sound/soc/codecs/aw88261/aw88261_device.h
>  create mode 100644 sound/soc/codecs/aw88261/aw88261_lib.c
>  create mode 100644 sound/soc/codecs/aw88261/aw88261_lib.h
>  create mode 100644 sound/soc/codecs/aw88261/aw88261_reg.h
> 
> 
> base-commit: 8d7868c41df58edabc4e408d119a1aef58a54d9d

A lot of code looks pretty similar (the same ?) to what was done for aw88395
  sound/soc/codecs/aw88395/

Is there a way to use common code instead of duplication ?

Best regards,
Hervé Codina
