Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43879645CA2
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 15:29:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6A591909;
	Wed,  7 Dec 2022 15:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6A591909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670423391;
	bh=gKjLyCy0TYRPALhzOzZCirgVNLK+AqvO/JTHJ+DCWtc=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QLjr5VPGjxDUCkkGTVZomA3gVbBgQYiJ4c5IHc2cGcp6yl47EHesN4C/SIOFRZZEe
	 kqLngRicdMO9g35fnblvX9agZfpi6QAlwwBrPBlKTLEI1S65QLsn3BL+CuoPyYbCpL
	 UuR4oavyLyExIqWefq9/B20YhVdv5gF6lDdiNF0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 576B1F80301;
	Wed,  7 Dec 2022 15:28:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D091F802BE; Wed,  7 Dec 2022 15:28:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B4DBF80121
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 15:28:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B4DBF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TXVWxpNC"
Received: by mail-ej1-x632.google.com with SMTP id b2so14367792eja.7
 for <alsa-devel@alsa-project.org>; Wed, 07 Dec 2022 06:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WVWcA4FbfJU4+XV9yl7jHpZbVXRHNmpC5V0q6HR8euM=;
 b=TXVWxpNC4+0D2ZUYJGhYUTYkIn6NelEksgGBii0XlP/T97PJ6GcD/ciXWc4k0KWf9F
 Qrxo/iD5FE9Ns/8MPVLuo+/Qvul0Gh4rdpKujoE/Ef+l4Num9CxYHEOylEKDOw30lY0P
 O4DnJyVVodtMlUcpOgItP7nO283yZ58F7EzGHufsNWm2OfiKZjmVqi3ATap0JwsyTqbT
 WmCzd2QGfXkt9A6bt/rNCm0kN4LP/sw1wB/tMBxQAGrk/Oddm3yTwUMFzm53jQc4McSC
 REf7ZmmUNPJ1AyYVZnvfsNotGAETuRQibY/TY7dKofPy1eJP3LxvGFn4JVEURtYz9Mfn
 G1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WVWcA4FbfJU4+XV9yl7jHpZbVXRHNmpC5V0q6HR8euM=;
 b=Xa05BWtSVsm4NW3jD2QJ9FQW5Ui4Uy3uoln/TbKygVPUsz2WRrMuG+69b1RHQqluAv
 RXBfqC13IHt2DLJLbCXBmOMHygD5RVSdLcFjQqWdTJR3z//cWdPPWLdCOSHw9nnC3/b/
 2l+Knz/fn9DHIAeJjGGLaUOzJOj8LPFWNyJ+TZYatNa4eyPPi8nWTJH0C4sbTqKAL6sr
 rUCyDtGDos9ZB4EYz+YGTVP0BkJSlWbDti2jL3hqbrPVgi9YtB7uHiYlbxMfNNpLwsPB
 J8QUVinNQRJzgolKVpXy6JX8fgC7Sf2nvl/QrSxvC24LbxbGzviKzOI8tjzsN6FYn0j3
 McVA==
X-Gm-Message-State: ANoB5pkq6B5/6N7RMoLceXjK88A7NEld6rrTLfwhfxA04QZk7pzeYvOK
 yD65PzL5i+B4wGyvByF3cKL7tZrNEKTF6Q==
X-Google-Smtp-Source: AA0mqf5fpet5hsIorXQLnhXBcXI+Fm6uBlkxPT/Od33I5/ccVKd+fsARXgGyQuWpKCgVeJiOrdxhVw==
X-Received: by 2002:a17:907:1b02:b0:7c0:a959:7ecf with SMTP id
 mp2-20020a1709071b0200b007c0a9597ecfmr26925963ejc.67.1670423314790; 
 Wed, 07 Dec 2022 06:28:34 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 gh22-20020a170906e09600b007bd7178d311sm8576500ejb.51.2022.12.07.06.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 06:28:34 -0800 (PST)
Date: Wed, 7 Dec 2022 17:28:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: cezary.rojewski@intel.com
Subject: [bug report] ALSA: hda: Interrupt servicing and BDL setup for
 compress streams
Message-ID: <Y5CjDmg5B/8J5Yim@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org
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

Hello Cezary Rojewski,

The patch 3e9582267e3a: "ALSA: hda: Interrupt servicing and BDL setup
for compress streams" from Dec 2, 2022, leads to the following Smatch
static checker warning:

	sound/hda/hdac_stream.c:544 snd_hdac_stream_setup_periods()
	error: uninitialized symbol 'dmab'.

sound/hda/hdac_stream.c
   487  int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
   488  {
   489          struct hdac_bus *bus = azx_dev->bus;
   490          struct snd_pcm_substream *substream = azx_dev->substream;
   491          struct snd_compr_stream *cstream = azx_dev->cstream;
   492          struct snd_pcm_runtime *runtime = NULL;
   493          struct snd_dma_buffer *dmab;
   494          __le32 *bdl;
   495          int i, ofs, periods, period_bytes;
   496          int pos_adj, pos_align;
   497  
   498          if (substream) {
   499                  runtime = substream->runtime;
   500                  dmab = snd_pcm_get_dma_buf(substream);
   501          } else if (cstream) {
   502                  dmab = snd_pcm_get_dma_buf(cstream);
   503          }

dmab is not initialized on else path.

   504  
   505          /* reset BDL address */
   506          snd_hdac_stream_writel(azx_dev, SD_BDLPL, 0);
   507          snd_hdac_stream_writel(azx_dev, SD_BDLPU, 0);
   508  
   509          period_bytes = azx_dev->period_bytes;
   510          periods = azx_dev->bufsize / period_bytes;
   511  
   512          /* program the initial BDL entries */
   513          bdl = (__le32 *)azx_dev->bdl.area;
   514          ofs = 0;
   515          azx_dev->frags = 0;
   516  
   517          pos_adj = bus->bdl_pos_adj;
   518          if (runtime && !azx_dev->no_period_wakeup && pos_adj > 0) {
   519                  pos_align = pos_adj;
   520                  pos_adj = DIV_ROUND_UP(pos_adj * runtime->rate, 48000);
   521                  if (!pos_adj)
   522                          pos_adj = pos_align;
   523                  else
   524                          pos_adj = roundup(pos_adj, pos_align);
   525                  pos_adj = frames_to_bytes(runtime, pos_adj);
   526                  if (pos_adj >= period_bytes) {
   527                          dev_warn(bus->dev, "Too big adjustment %d\n",
   528                                   pos_adj);
   529                          pos_adj = 0;
   530                  } else {
   531                          ofs = setup_bdle(bus, dmab, azx_dev,
   532                                           &bdl, ofs, pos_adj, true);

This is okay because runtime is set.

   533                          if (ofs < 0)
   534                                  goto error;
   535                  }
   536          } else
   537                  pos_adj = 0;
   538  
   539          for (i = 0; i < periods; i++) {
   540                  if (i == periods - 1 && pos_adj)
   541                          ofs = setup_bdle(bus, dmab, azx_dev,

This is okay because pos_adj is checked.

   542                                           &bdl, ofs, period_bytes - pos_adj, 0);
   543                  else
   544                          ofs = setup_bdle(bus, dmab, azx_dev,
                                                      ^^^^
Potentially uninitialized?

   545                                           &bdl, ofs, period_bytes,
   546                                           !azx_dev->no_period_wakeup);
   547                  if (ofs < 0)
   548                          goto error;
   549          }
   550          return 0;
   551  
   552   error:
   553          dev_err(bus->dev, "Too many BDL entries: buffer=%d, period=%d\n",
   554                  azx_dev->bufsize, period_bytes);
   555          return -EINVAL;
   556  }

regards,
dan carpenter
