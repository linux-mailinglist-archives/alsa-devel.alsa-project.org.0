Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 667292E83DD
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jan 2021 14:42:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E56AE1708;
	Fri,  1 Jan 2021 14:41:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E56AE1708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609508542;
	bh=BrkBQ5vIHqe6f6xrx8hy9Jav+HoSuGXHjiGXaSdCXWA=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k2D/4ho9AZlu6KZgALlc5uWlCbwVy/C0fzYsNlSRcZyGGrgEuXcSGn3BoutinUUZd
	 M9trntvVqOk6rJScteIk3yvSykhu2Brq0tq+Y+Yj145QBytB+sn9qXQ4U0PB24XKBh
	 IwcwmdStvEgdKbyfFM58xKCrNKRvAZDtApMSIsyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42B7FF8020B;
	Fri,  1 Jan 2021 14:40:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC101F801F5; Fri,  1 Jan 2021 14:40:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E9FBF8012B
 for <alsa-devel@alsa-project.org>; Fri,  1 Jan 2021 14:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E9FBF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uw03fVEo"
Received: by mail-ej1-x62e.google.com with SMTP id b9so28131861ejy.0
 for <alsa-devel@alsa-project.org>; Fri, 01 Jan 2021 05:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=m2TQwO2bCd2WK8PiU+RT/d5GyJZgLqospHYCJRJ3JTM=;
 b=uw03fVEo/Vl2LVxTKvNsgjKCnXO6uvDlGwnpoBB/t/hS7F0Wwgu3N5iTfGhTF/I9Nu
 9VFi2RiXA2iYr+fjj2QqvWrbjgH9dacd3uJIJiEWVlxYzOeUHqSBUdWuXuCWC2H/xh/f
 lF2Eac9y7pjR3iQmqNdxWMSyYVRw5qIQmPOhLp6naVtkAjTIXkhKp+WSmZSEiEdfrvP2
 +2qXcJXyVxbMI7D4jgXcwPEdG5wI8I8P+fFm2wkHr7XH049yQKf3PLjAIfsBJM3Ip30f
 umiiob4Lox2UBJPliid8ltkp+J8pO6cM2MwwxpGLGaLlssMq9sfpiaudGzPBGQSkkXvZ
 xnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=m2TQwO2bCd2WK8PiU+RT/d5GyJZgLqospHYCJRJ3JTM=;
 b=jbIl7RSzkUZADMK3ZXBvDoJKuRAwaRkUAy87EOGjuRshuM3fw5JwZMWdU5aNmuAB+S
 5RcaEERqWhIMPTTlgdNMMb1YbA1RtaF4YkbeLUjgokIFixvSu9r+k8CZOZUh3YK6jSk2
 JnHxZPZQK/LEzlhGYFfADR+Gc7Y7mmPRCCRzHwSUdXFQJY9d0Ebc7qTOPfaB6ty3TMfc
 zhmZhz/dwDP+SaZR6XCzrb/TCI/MXXBzaYN4JkS5yti+35flW1nxQ8fxG9tRpp5lbp0a
 XxuyqSZ0oZcTjMyLEd1W3ysNoHTC4Jd+VCWmDh1oe36b38NWcyqYuz/2LFnuKnVpAekA
 LfUw==
X-Gm-Message-State: AOAM530w8kCtuuPWYWk1dog1WCXaNrP66Nw2EKlWbx764S8NsaYXaq5u
 jSqTmrUUFP0mAuDtW2CskK0s58mgS9Qw3Q==
X-Google-Smtp-Source: ABdhPJzsMutXDbEmw3SMg1cB2rTlGjZFtWpYNX75RGxNRZDKap/QzaIvW6A/apAS5pdfI+eOMX+K9g==
X-Received: by 2002:a17:906:af99:: with SMTP id
 mj25mr58392391ejb.414.1609508441375; 
 Fri, 01 Jan 2021 05:40:41 -0800 (PST)
Received: from cl-fw-1.fritz.box
 (p200300d867287f008e6f6d509bafaa1a.dip0.t-ipconnect.de.
 [2003:d8:6728:7f00:8e6f:6d50:9baf:aa1a])
 by smtp.gmail.com with ESMTPSA id oq7sm21086004ejb.63.2021.01.01.05.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 05:40:40 -0800 (PST)
Message-ID: <d206434bed33930cb54b643f3d1968cf21973167.camel@gmail.com>
Subject: Re: Haswell audio no longer working with new Catpt driver
From: Christian Labisch <clnetbox@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.de>
Date: Fri, 01 Jan 2021 14:40:39 +0100
In-Reply-To: <3dcc3129-aee5-0eea-0307-4eba7f03c0d6@metafoo.de>
References: <8b005c64fe129fc2a283da90b2949b1fcb42e8c2.camel@gmail.com>
 <1ad341b1b0e0eefb83d157ac24d162eaad53ab32.camel@gmail.com>
 <0111f282-f044-47ed-f93e-5a19de61bdce@metafoo.de>
 <088cd3b6ba6589266e316d6adcb76861edd18775.camel@gmail.com>
 <s5h1rf4c10a.wl-tiwai@suse.de>
 <1f5c37af35419358a8d7f22544490088675b2c3f.camel@gmail.com>
 <3dcc3129-aee5-0eea-0307-4eba7f03c0d6@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: gregkh@linuxfoundation.org,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, amadeuszx.slawinski@linux.intel.com
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

$ cat /sys/module/snd_hda_intel/parameters/power_save
0

On Fri, 2021-01-01 at 14:29 +0100, Lars-Peter Clausen wrote:
> 
> 
> On 1/1/21 2:25 PM, Christian Labisch wrote:
> > Hi Takashi,
> > 
> > Thanks for your suggestion - unfortunately it does not work.
> > Still no sound after adding the boot parameter and a reboot.
> 
> Can you run `cat /sys/module/snd_hda_intel/parameters/power_save` and 
> check whether it is still 0 when the system is running?
> 
> > 
> > Regards,
> > Christian
> > 
> > On Fri, 2021-01-01 at 13:09 +0100, Takashi Iwai wrote:
> > > On Fri, 01 Jan 2021 12:10:23 +0100,
> > > Christian Labisch wrote:
> > > > Hi Lars,
> > > > 
> > > > Thanks for your response, as requested I ran alsa-info while playing audio.
> > > > Please check the attached information - to me it looks like it being a bug.
> > > > It should affect many users, will it be solved in the next release 5.10.5 ?
> > > It's likely some runtime PM-related changes that caused this behavior
> > > change.  But, there must be some program that sets the power_save
> > > option explicitly on your system.  As dmesg shows, the default
> > > power_save to this device has been suppressed, but it's activated by
> > > the later action.  On, 5.9.x, this didn't take effect, but on 5.10.x,
> > > this became effective, as it seems.
> > > 
> > > You can try to pass power_save=0 option to snd-hda-intel module (or
> > > boot with snd_hda_intel.power_save=0 boot option).  It could work
> > > around the issue, although it's no solution.
> > > 
> > > 
> > > thanks,
> > > 
> > > Takashi
> 
> 

