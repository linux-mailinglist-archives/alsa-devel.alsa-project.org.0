Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6780C41F8ED
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 03:03:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E38EE16FA;
	Sat,  2 Oct 2021 03:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E38EE16FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633136585;
	bh=mRbPVtp/UH+CpMXfNzctpOJJ5LxSRGdKywrN34Copo4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OiS3IQTD547glpN/iYtJTsDbJ4ymg6aUkwLyQdpfT66UJBWmoifEJ1/YuqwMQDzu2
	 E2xS6Di6kwPbo+Hgu9aFSnxqWTKc4SeAR39pxNQyTDnP2fH943eEPYYFnjzu8Ut1JP
	 xn0mrlVsbUKo1U+5ofc72T08eKCk/NLb3Nwc9Nfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF165F8026D;
	Sat,  2 Oct 2021 03:01:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2B8CF80245; Sat,  2 Oct 2021 03:01:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20581F80165
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 03:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20581F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qzdMIcTB"
Received: by mail-qt1-x82c.google.com with SMTP id d8so489772qtd.5
 for <alsa-devel@alsa-project.org>; Fri, 01 Oct 2021 18:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bZq8+bdlI5UzSp5wHhjcmlVOFZxaZYynNZOcMzOwkA0=;
 b=qzdMIcTBampQX/pRMOV3ZXzfK+KQep69vMmqH8kbCjsSsZrIxS8veMBCbIy/+JfwZN
 rZbvJTufPXFBrf+NvvxC5MY7TtTZhbcuFSAa5bh/5UeY5P5cRshcSvtVweoLBJoL4AUV
 52UcxROlVcB7aK9RFJm1T0lp6s0iJPkN1YgULia7tncGRNL80EojDx4a0uHf5Z+gzeSf
 sPHX+MJfaNen3tp6NN2ljtF/wE8fkA5scOP0AbbgGDR4PjxEMlVqRqpUSjtipkmGjq7K
 sQsbY/wlf6nYPTXXKvOqvReoBI6J9YgW871ZJkCmZml3gkjR2yfPsvMhpCl5OfNqhAMY
 qCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bZq8+bdlI5UzSp5wHhjcmlVOFZxaZYynNZOcMzOwkA0=;
 b=dg0W/am+v6h79Gy+K0Sh9gy0S/DcFeNwx3LOmYk5ne30PdZ0zK3iYq1uGDOCrwrjx0
 U9+61UqiezRQ/FUaKvXCN4+Kr0eusVuYlj7hu31zKaeAWFp2rjEnG+x6EVd3EOmuB5ZZ
 3aeIh013TMOqF/Ml80i3syNla50LE2/bw6Q4T/QWIp2uEqJSoTW8bKe2XLUJt13091Df
 PmWHn2Dkw8D0KWN0I+pNUPSHAaF8wzWbU6TQ067YWQGeJRfr3O6KrVEMQzCrbFn2Qa+K
 4DeiIej15J5XebM1frV6V30jF7b58HgDZRIsASuMJxjtoh8/6FSco9SpFlWaMODAAtzV
 yl3g==
X-Gm-Message-State: AOAM532a4PLPnlyH8/ezRm5l2EdkCDj4IDUUVpCfKSANKaMeJvZLrGZl
 FskN3z4AS2en3yw+J0nPTKQ=
X-Google-Smtp-Source: ABdhPJzG/2nxUUO3GSfpu88FZPTaxAmWzZjbMSC6SD5gNlYkC8VbSnH8qCpJQTOkoh7Roc6uLYDEUw==
X-Received: by 2002:ac8:4088:: with SMTP id p8mr1063124qtl.279.1633136493232; 
 Fri, 01 Oct 2021 18:01:33 -0700 (PDT)
Received: from geday ([2804:7f2:8280:6c81:98f0:31ff:fe93:2dc7])
 by smtp.gmail.com with ESMTPSA id m11sm3817504qkm.88.2021.10.01.18.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 18:01:32 -0700 (PDT)
Date: Fri, 1 Oct 2021 22:01:30 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Zhang Boyang <zhangboyang.id@gmail.com>
Subject: Re: [BUG?] Setting (start_threshold > stop_threshold) makes
 snd_pcm_writei(a_small_buffer) XRUN immediately
Message-ID: <YVevasDJYHjIxwjg@geday>
References: <0b00ad37-41a3-f078-6600-d3580ad903a1@gmail.com>
 <YVeawIksIf1wKa2s@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVeawIksIf1wKa2s@geday>
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

On Fri, Oct 01, 2021 at 08:33:23PM -0300, Geraldo Nascimento wrote:
> On Sat, Oct 02, 2021 at 01:31:12AM +0800, Zhang Boyang wrote:
> > Hello,
> 
> Hello, Zhang!
> 
> > 
> >    I'm using ALSA to develop an audio-streaming application. I try to 
> > use start_threshold and stop_threshold in combination with small 
> > buffers. However, I think I probably found a bug about this.
> >    I'm setting start_threshold=100 and stop_threshold=50. I'm also using 
> > a buffer of 44 frames. When I call 
> > snd_pcm_writei(the_small_44_frames_buffer), pcm state came to XRUN from 
> > PREPARED directly. I think this is a bug because the stream hasn't 
> > started. It's hard to say a xrun occurred while stream not started.
> >    I'm wondering if this is a ALSA-bug or a misuse of ALSA. A simple bug 
> > test program is attached.
> 
> No, I don't think it's a bug. You're bound to run into problems with a
> period size of only 44 frames.
> 
> Moreover, working with the code you provided, I was able to get a RUNNING
> state without XRUNs with a period size of 4410 frames (100 milliseconds of
> audio) but I had to comment out snd_pcm_sw_params_set_stop_threshold() for
> it to work or I'd have those instant XRUNs.
> 
> That's how snd_pcm_sw_params_set_stop_threshold() is supposed to work by
> the way. It creates a XRUN once the threshold is hit.

Oh, and snd_pcm_sw_params_set_stop_threshold() is a little
counter-intuitive. The threshold you give the function is compared to
the available free space in the ring buffer, not the filled space.

That's why lowering the stop threshold makes XRUNs more likely...

Thanks,
Geraldo Nascimento
