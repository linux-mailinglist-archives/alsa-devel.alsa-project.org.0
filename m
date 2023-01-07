Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 193A4660EDB
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 13:38:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FBA115DDB;
	Sat,  7 Jan 2023 13:37:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FBA115DDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673095107;
	bh=N/KkzdsSRJ+VfLbhY6uQEzbIwe5gbWUCWk7cZWUN2KY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iTjNvGB/XLRASs1tIJhREsga14AKXEu9l4G9KDeFX9hZzHFZk9gNnHSYqdu0fhLUp
	 uz63sILUGaXmTWQ8EPbRYGFtXi5RYWstS0tfjxGlClmOfVn3Y453bQf/t0nsfzunkO
	 CnB1B/oOYs1CnL7fDGsKIEJ3XoAan0ZTk6nm6a8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4485BF800C0;
	Sat,  7 Jan 2023 13:37:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC766F804AA; Sat,  7 Jan 2023 13:37:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EE6EF8027B
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 13:37:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EE6EF8027B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eyRQjG6z
Received: by mail-wm1-x32e.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so2824737wms.4
 for <alsa-devel@alsa-project.org>; Sat, 07 Jan 2023 04:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y8EqRvpgTHNHfYexztZxeAorA2WCR7z7SyYcQh2C/oI=;
 b=eyRQjG6z6ks9xyB17qePqxhYwXBfQ4uh4js1qooZUcHiyfe2+BjElBWuidCH6IJaF0
 oUXO9AsqE5Ctxu5VyBS2mtxDUqydwmzmJsB9UpSvQNCcn2binEgYnCwZC3CFnnMaXC3A
 Wp213EEIUXc38dYSaIGHKoQk3Z7VMZqqGBfwWLG1ziP4dlm2BEfWF0NGOM4aHSiwxQyM
 LvfEe0IYiaJHDEbbhVCDPKq7A+eguHv35uhvy5PUhnk1cHI8klKLfLEh28r++Yd5EcFC
 ZPr8sqy3oE4YTxSQkCpugN7sfLDOKAo6O+ZeyAbUqsWIvdDhFQXmOHBKC5uO/G85x3Xn
 vy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8EqRvpgTHNHfYexztZxeAorA2WCR7z7SyYcQh2C/oI=;
 b=uoW1cu970AHP9HYrw9PmPU7QuztnqKViRPkLYV/Cr+SMECn4v20lUnbhaMst/1k+P4
 SLtlD8BBFRDjGOceZ6akbIBq1TxLzzjEuWlCRZMfZRS08oQgtxmGf7lqWVNn6UsMqK6r
 reZwGr6vaCOZ2y0KFhH0AD0ZiZvvUJokjrdXJxajzeoDYY5dTtlDcM+0RVcTbpOXuZ/+
 XvP4SlDfBKvPt3+8AlPNZ544uHMEzMZgmc1D/SwyYPVlbLyfTs/vfuAPbmWAHU8ZDnkg
 3pNawUe4iRPqIQ2sWJNzLUD/WMRa0zLu88UOXjZbfW/izZCyiwrfL7y7TBydZux2weVZ
 aEaw==
X-Gm-Message-State: AFqh2koLh4VlqflPMGd50ufwqdP378qpzVgQVEUgfwNgR/52YuUkekKq
 k6Zji6njMR5mp4ZJJrd48C4=
X-Google-Smtp-Source: AMrXdXsy0l1qggk6lEvS/ZcPpvdBQvUlqnkPo8JssyGx4buZhIxBRmZkWSU0hMbpUJS8Ki1r0nr1ug==
X-Received: by 2002:a05:600c:c07:b0:3d9:73fe:96f8 with SMTP id
 fm7-20020a05600c0c0700b003d973fe96f8mr35200532wmb.32.1673095040436; 
 Sat, 07 Jan 2023 04:37:20 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 i10-20020adff30a000000b0024228b0b932sm4476213wro.27.2023.01.07.04.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 04:37:19 -0800 (PST)
Date: Sat, 7 Jan 2023 15:37:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH 14/14] Fixed the retry_cnt bug about being zero
Message-ID: <Y7lne4CN9tESjAbA@kadam>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
 <20230106091543.2440-15-kiseok.jo@irondevice.com>
 <Y7fplQ18qyhKDC44@kadam>
 <SLXP216MB0077B3BA3C18AD8F5A10F9708CFB9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SLXP216MB0077B3BA3C18AD8F5A10F9708CFB9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Application <application@irondevice.com>,
 kernel test robot <lkp@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 06, 2023 at 09:55:43AM +0000, Ki-Seok Jo wrote:
> 
> Hi Dan,
> 
> I'm sorry. There was an opinion that the pach sent last time was inconvenient to look at because the entire patch aws modified at once.
> 

What you should have done was just fold everything into two patches:
patch 1: add the driver
patch 2: add the device tree bindings

Instead you did:
patch 1: add the driver
patch 2: add the device tree bindings
patch 3: re-write all of patch 1.

Re-writing everything is not allowed, but it's also not necessary.  And
also it is against the rules to submit broken code and fix it later.

It's a new driver so just fix patch 1 and resend that as a v2 patch.
Same for the stuff I mentioned in my bug report.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

