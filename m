Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A91612FC1
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 06:39:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A889B1637;
	Mon, 31 Oct 2022 06:38:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A889B1637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667194766;
	bh=mqSblXv0mTqleQUiHj57WceC7m5j8D4qF/VjTxeN/5E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EtXtuUV0dBCMzGzgA9zqSOT1JEYj/iEinNR0MY99iVHtHrKJPkAeLcOzx5MebgHIb
	 vNWSHkVlRJEmgLMrikJSwybf4uNmJETpUVaf2lyGCpdDR01wArkE9BVO++Xv1U4+4F
	 II1faWOVROHz/QIf7D1KisRyfTbiqpQsni5RN4fA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08D0AF800E1;
	Mon, 31 Oct 2022 06:38:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43A4AF80163; Mon, 31 Oct 2022 06:38:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FSL_HELO_FAKE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD740F800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 06:38:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD740F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bUYKMiFO"
Received: by mail-pj1-x1031.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so14957299pji.1
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 22:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/UHrfjKiovZQc+3fmk0jidTcvkQd82+qbKUFsraZYBE=;
 b=bUYKMiFON/+UE5LVAf6OaGkaCyF7WfivvqRu+3318rElHvQeGS7pRsYUSdXAxXW2rS
 +jx5o/Fk/rv4CH+zxbMrReDSYAdOPqi9FS+U56bJUJjkmRXioOQDuXeVPsutdfCIJk6v
 snQ9pG+qu2DBRRrEpzyJPChpPzEEFZb5h0KEKEmoQ9VKgIXD3ZVdE+1U/kaNN9RQAvln
 3AOM3d2DZt8GlYJWEdwoiUc+oPJ66O4qh75FJT7N7PaExSPLz2TEtZjY/gx3oADQs/KS
 zPJIegCI1tmZHkqjCpAHVb9vQL4o9cMGYoC5toN7P7kH7+x7DAJ+VGxUQzaELJXN+9D+
 +PDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/UHrfjKiovZQc+3fmk0jidTcvkQd82+qbKUFsraZYBE=;
 b=hwR0E335wrNAw8fLMuiIOfITvYD256lNPKUCFCMP6NNPE7HaQoVLX/vBuuwoeQUr2P
 f/5qeYpnWfaMZgevhjccMimt0ku1EOTcUh3Q3mD6lyuoQAKIPV31a18YdyfcFdJ6VusO
 S+2W5CujjDbQryiI3b7wpclhUhoOZZnc1gxwOPA/w9axtMJVStnVZDVEcAUblG5+qnun
 7eYZfDWskXUnjYZjHU1K+z5dtOwOTewvbM6WOM/lDlnRw0pID0D586L0r+g5HC7nkKta
 gMwva/ToyJD80XQKyIKiLm90Jpibif0SO1roL/bf9LbZFDEVnJkOvo9CHyt6fOZCUqWH
 t2JA==
X-Gm-Message-State: ACrzQf2IDY9cNbwY5ASRcwQ8WJuRtKS0a+aE8f7h20QfxxKs3Cf8PZbe
 ZoHgAyE8ic6eHoKX0cxmIVI=
X-Google-Smtp-Source: AMsMyM6ECFSRrJ8RFE/9nnWqZ59bDZQk1HMdwHi++AgaN63UnU1jJiELqNrKBYXy0xwumLK2CNUtEQ==
X-Received: by 2002:a17:902:f641:b0:17f:3633:5439 with SMTP id
 m1-20020a170902f64100b0017f36335439mr12865125plg.94.1667194700472; 
 Sun, 30 Oct 2022 22:38:20 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b001754064ac31sm3517555plj.280.2022.10.30.22.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:38:19 -0700 (PDT)
Date: Sun, 30 Oct 2022 22:38:16 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 07/10] hda: cs35l41: Add support for CS35L41 in HDA
 systems
Message-ID: <Y19fSL2Z6xq8TCFS@google.com>
References: <20211217115708.882525-1-tanureal@opensource.cirrus.com>
 <20211217115708.882525-8-tanureal@opensource.cirrus.com>
 <CAHp75VdQGBixkUStPiq3VuoL+9TJo946ObfRA-L-D72DaFHnrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdQGBixkUStPiq3VuoL+9TJo946ObfRA-L-D72DaFHnrw@mail.gmail.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Len Brown <lenb@kernel.org>
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

Sorry for resurrecting old thread...

On Thu, Jan 06, 2022 at 02:29:58PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 17, 2021 at 5:45 PM Lucas Tanure
> <tanureal@opensource.cirrus.com> wrote:
> >
> > Add support for CS35L41 using a new separated driver
> > that can be used in all upcoming designs

...

> > +       /* No devm_ version as CLSA0100, in no_acpi_dsd case, can't use devm version */
> 
> Can you elaborate why devm can't be used?
> 
> > +       cs35l41->reset_gpio = fwnode_gpiod_get_index(&adev->fwnode, "reset", cs35l41->index,
> 
> Please, do not dereference fwnode pointers.
> Also, why can't you use the device instead of fwnode?

We are doing "acpi_dev_put(adev);" a few lines above, so using adev in
the call to fwnode_gpiod_get_index() is technically use-after-free,
isn't it?

Also, why can't we do

	cs35l41->reset_gpio = gpiod_get_index(acpi_dev, "reset",
					      cs35l41->index,
					      GPIOD_OUT_LOW);

since acpi_dev is device structure corresponding to adev and we are
getting the rest of the properties from it?

I saw downthread that there was supposed to be a patch addressing
several issues raised by Andy, was it ever submitted?

Thanks.

-- 
Dmitry
