Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 770AF2DC8C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 14:17:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F1EC16DD;
	Wed, 29 May 2019 14:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F1EC16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559132227;
	bh=uRnsYcmzEBnh6ndOne6oBvkGZCSB+9k1lnzj7c3Y2AU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aku9k4RALIbjcscV1e5uGuaOnvmA/sqW/PrS9qLtURQolfuZt5Dp6DN0k/+oCXVr7
	 x3R1lFjOk6ysAR+1jtAUzS4JIimfiZ+3NOcpzVGt0O22eWBxNJr7T7pOIbG9bvFis/
	 NRUiRlQqwkSyumPYWFld0B9lONkcMPhJ6VwDhjxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 693BEF896E0;
	Wed, 29 May 2019 14:15:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8197BF896E4; Wed, 29 May 2019 14:15:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CC6FF8065A
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 14:15:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CC6FF8065A
Received: by mail-it1-f195.google.com with SMTP id m141so3352757ita.3
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 05:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QZE90PbMQUMysN2cdrlqFeh9pTGQMp2qxHloA4A2Q7Q=;
 b=eoYW4MbAGVgsKwgivnyIt6wQQ5Pcfw+zXisjmMtQ1pZ0+JRPlCCDPoSPfSB78za+hO
 KVlCh4ajZD6M98ibw8SyqyKRqqOYtTxCKTcQBdzxij+9Exf/wQEKvtq2hI2/x+z0aIsU
 e61N/y4JmqqZGfrRCo2HSYJNWjU3D4ONsfyOk0bybBADLdhhSDINhgK+xxAuE36ftq9z
 wOejjriGxqbWS8o9VU0aL+LjTTIXd9Gw4pRn04QMvgMr5SQ5sXxEenEEVNgr7PZJC9R5
 iDM1WJt1BBCrAvlzLZnO07inB2Ck93g8Blrpdp4JKb+2hUW3tCuqeJJfxDJaUW5Zdr3i
 rX8w==
X-Gm-Message-State: APjAAAWjBoqX+U90KP4angsLqAuWWOG4J+GOHdCmxc9FDOW8NrZh/IV8
 G6lh6auXpfVoD9Iq3OsWJAaJGBJzKEA=
X-Google-Smtp-Source: APXvYqxJ+KiEHP8MHkOGl9EcPq5PtgtMmSfJ+OyQXBhrfkuYe+Xzm8fwN2a7fmn5rLHL87YYbX7uaQ==
X-Received: by 2002:a24:53c4:: with SMTP id n187mr7296540itb.167.1559132113612; 
 Wed, 29 May 2019 05:15:13 -0700 (PDT)
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com.
 [209.85.166.179])
 by smtp.gmail.com with ESMTPSA id y7sm5759700ioa.77.2019.05.29.05.15.12
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 05:15:12 -0700 (PDT)
Received: by mail-it1-f179.google.com with SMTP id e184so3141550ite.1
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 05:15:12 -0700 (PDT)
X-Received: by 2002:a24:5252:: with SMTP id d79mr6656156itb.14.1559132112561; 
 Wed, 29 May 2019 05:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <1559040459-16488-1-git-send-email-georgii.staroselskii@emlid.com>
 <CAGb2v64osE5yVdpCxSRfpkaq2TqeUUiLUbr3wZWW1rawuqxW-Q@mail.gmail.com>
 <20190529102824.GN2456@sirena.org.uk>
In-Reply-To: <20190529102824.GN2456@sirena.org.uk>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 29 May 2019 20:14:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v67dFY+CYBLMe2p9tq6eS9J-SJqAgF-APGdXVjcqbp2Kxw@mail.gmail.com>
Message-ID: <CAGb2v67dFY+CYBLMe2p9tq6eS9J-SJqAgF-APGdXVjcqbp2Kxw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Danny Milosavljevic <dannym@scratchpost.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Georgii Staroselskii <georgii.staroselskii@emlid.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: sun4i-codec: fix first delay on
	Speaker
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, May 29, 2019 at 6:28 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, May 29, 2019 at 10:34:25AM +0800, Chen-Yu Tsai wrote:
>
> > I wonder if we shouldn't just keep the amplifier section powered up
> > all the time.
> > Also it seems not very many codec drivers go all out with DAPM.
>
> Leaving the amplifier powered up all the time is going to burn a lot of
> power and make any pop/click issues in the inputs more apparent.

Sounds like this patch is a better compromise. Thanks for the insight.

The patch is

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
