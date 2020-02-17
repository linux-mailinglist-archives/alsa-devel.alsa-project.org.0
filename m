Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB45160BD0
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 08:43:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A79AA167B;
	Mon, 17 Feb 2020 08:42:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A79AA167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581925409;
	bh=A8yBkcgmGWA5nS+EptjQSxvzstMXcSYYvRhwSVkNZGs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KQ66P75AZMOTD8Xnck5hwcC7w5Ry5bX2PuVSYxmYUiHhS7enwk7yDgx4MNT9PMkEi
	 7D14RgtH3/N4JaA7hDy7OoWalzix3FMgrjSTtukV+zfqI9RqmZXioGcPfdwFpWdSbS
	 GXjdMnNQHOaSIGdPeqQOWN5KyCQzdHJzm5lPpfsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5AB7F801F4;
	Mon, 17 Feb 2020 08:41:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 607C4F80172; Mon, 17 Feb 2020 08:41:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B07EF800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 08:41:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B07EF800B6
Received: by mail-ed1-f65.google.com with SMTP id m13so19538799edb.6
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:41:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=76WiewyfAQysMsVYcXQkeWLkjiTOOZNh8t0AnmKu14M=;
 b=rm8rtr3wGMSw9ecqeSaN6CYH+23imVn5NxpydjYwIo4seoHj182Tq8Fc3Yve8az+bE
 qDkwmpoy2MLUGt5upEG3gVKAwjLMdz4W7vBL8B0PrBTBZ7+ERXOsQTEeNl/pWhjzbMxW
 b+hRyg1fep54Cv/Q/8se3ATwENOPvndv3mDYcHfz8ECdMycxdopU5ZRG7zv3rW+7p1r+
 3Ysn69eQayaHKGfak3W47UDoeyraX1esII9frxy9AxNjVWFTZHqIRNXwF02lJyLsUQjx
 pP4QuayjW0oY7Orsu0hXs4bIA7cg6RxW1F5wVObz02WkzL127FUiQRFYxR8ZOhYCMvD2
 kDZw==
X-Gm-Message-State: APjAAAVqJeqW680AttHUpqWjBcroVNHx8LSmRWWBzVVpwHmlqD851izx
 1JRD51SNa9Adf23azZBKvIbeyshZGAI=
X-Google-Smtp-Source: APXvYqx3ARg/VKTodSLakwokTbhvOs5gPpVAhywE6QXWamu7sn3HKOqnf4ZEWx3oFR0tPxCpWMtY9w==
X-Received: by 2002:aa7:d712:: with SMTP id t18mr7645944edq.0.1581925302089;
 Sun, 16 Feb 2020 23:41:42 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49])
 by smtp.gmail.com with ESMTPSA id l1sm212266edf.43.2020.02.16.23.41.41
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2020 23:41:41 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id n10so16407881wrm.1
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:41:40 -0800 (PST)
X-Received: by 2002:a5d:484f:: with SMTP id n15mr20324028wrs.365.1581925300705; 
 Sun, 16 Feb 2020 23:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-5-samuel@sholland.org>
In-Reply-To: <20200217064250.15516-5-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 15:41:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v6543yLuBUi_37DbFdfkOo_OBK8v-rB2hViex_BCzAurPQ@mail.gmail.com>
Message-ID: <CAGb2v6543yLuBUi_37DbFdfkOo_OBK8v-rB2hViex_BCzAurPQ@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@free-electrons.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [RFC PATCH 04/34] ASoC: sun8i-codec: Remove unused
	dev from codec struct
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

On Mon, Feb 17, 2020 at 2:42 PM Samuel Holland <samuel@sholland.org> wrote:
>
> This field is not used anywhere in the driver, so remove it.
>
> Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
