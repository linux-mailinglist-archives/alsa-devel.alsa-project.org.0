Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B050A595D82
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 15:38:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 503371636;
	Tue, 16 Aug 2022 15:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 503371636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660657114;
	bh=nY2YhApJtZhCdMQ9fGT2N8DgMFSZCVWHe2N5EHl24so=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oBtH3TxwHfSR+FcP69UAJQ5dNxj9FMkwCBja+FaMnZNfedTF5hphkDJitNry6EjFi
	 QpVTSgIPkTNHRzwxgsyCYAMjCpGp6+uI4mZEeUOK4lt5M1n3HjPPvG3/k8bBQ6yiEq
	 HwV7PApeZr36D7T0s9PpJYS1iZKvUPVAUM/pnFz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA1CDF80095;
	Tue, 16 Aug 2022 15:37:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E5D2F80424; Tue, 16 Aug 2022 15:37:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E50F7F80238
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 15:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E50F7F80238
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="n8ClU9SC"
Received: by mail-vs1-xe2d.google.com with SMTP id k2so10110390vsk.8
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 06:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=WTcX5Y71BPdKxWhQiTPJQNqDC+IPRY3B0AkRiOvU51s=;
 b=n8ClU9SCsLFS+5cuVQZQmz9lcP6R/PdWXjWdmhXeb5vWkH4EPAyC/7fGelTVipWWIA
 w37XjHVdEOhIKSQ/yeevLqFfSO6Z4XyuA1+CQI/bjJSkJKUACWeqD9oNuLCH1lJn5R1G
 mihEXLBriu69JtiYfDiIEEq/ByioUrlhRbN+QJABr5ssgLVejmGqzjqHm2RVOe6ZHc0K
 2xxaVKtQi1j7bO2fPN4XgL3hNgYonxSTLQ/aachECcvXLP9MVnXwS2e+QTE1wVEizCdd
 BuG1urPq5KYlST+C67Ty35jAjsPAj7APBaflz9ij2qy0GjKh1N1p8jp74Nu40GGPNfH9
 jVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=WTcX5Y71BPdKxWhQiTPJQNqDC+IPRY3B0AkRiOvU51s=;
 b=buH2k7kNuf6d91msgG4aNpnIOT/yKsWWylwOWajuuwSQ2zgAtFUZ0I43jawAKZN3gY
 ytzC16YkTdczvih79T3SOk4QSgYJCeNESVjKI5iMbQif+sPNDjdMwrllWF/4w6GgnxNM
 5I3Pq37mhDOPqA+kjWTsPRv/UzZ+/1qctRKquj6yUUakm4ysgCyQkpq/VVby0Iek+am3
 PzzMWMO/lJSfAM70kIh6d5lHiRbuOo5hN9QgU+aw5UOHmASSjTAJRv2d4QG042njERtq
 vm4giCRjt304VcnRL0Ot5l8BDKDPmoLKlg3MdP1ONNBzZM8Mo7nJ5nlZdpNVsL0HNK2E
 JPhQ==
X-Gm-Message-State: ACgBeo07klKhLR5MAvd9X7w6zb48r3KttX8VYjGssxOgnB77YhqV+LtH
 xf9X65APMjNjsPOqGTgUAlk=
X-Google-Smtp-Source: AA6agR5TkJ4sp1n17cRgDFnpunC82pUCXqW9LvIjGD3FyrF5haBB6uHlzYHxVFYgRI1zjTkcTd11Ng==
X-Received: by 2002:a67:c807:0:b0:385:4678:a62b with SMTP id
 u7-20020a67c807000000b003854678a62bmr8327995vsk.11.1660657044791; 
 Tue, 16 Aug 2022 06:37:24 -0700 (PDT)
Received: from geday ([2804:7f2:8006:9bc6:14ea:bdc5:dc66:de30])
 by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8465973vkc.48.2022.08.16.06.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 06:37:24 -0700 (PDT)
Date: Tue, 16 Aug 2022 10:37:18 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: Rockchip I2S commit possibly ignored
Message-ID: <Yvudjkjxtv7M/DPL@geday>
References: <YvuYZE0biiAn/sxQ@geday>
 <YvuZbrBWzRjHYQZj@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvuZbrBWzRjHYQZj@sirena.org.uk>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
 ALSA-devel <alsa-devel@alsa-project.org>
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

On Tue, Aug 16, 2022 at 02:19:42PM +0100, Mark Brown wrote:
> On Tue, Aug 16, 2022 at 10:15:16AM -0300, Geraldo Nascimento wrote:
> 
> > I was looking at Rockchip I2S commits and it seems "ASoC: rockchip: i2s:
> > Reset the controller if soft reset failed" was supposed to have been
> > merged to your sound.git but never was. I don't know if this was
> > intentional or a real miss but in any case I'm letting you know.
> 
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so 
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.
> 
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.

This isn't my patch, it's a patch by Sugar Zhang from Rockchip that was
supposed to have been applied one year ago, give or take 10 days. I
can't resend a patch that wasn't authored by me.

Therefore I don't see the point of your complaint about "content free pings".

> 
> > However in the alsa-devel archives,
> > https://mailman.alsa-project.org/pipermail/alsa-devel/2021-August/189050.html
> > I see there was no commit info for the unmerged patch. Perhaps this
> > caused it to be black-holed?
> 
> If there was no commit info that means it wasn't applied.

That's what I thought. Cc:ing Sugar Zhang now.
