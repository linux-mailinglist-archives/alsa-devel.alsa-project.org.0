Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84373D686D
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 19:26:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10899167F;
	Mon, 14 Oct 2019 19:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10899167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571073963;
	bh=C+zkJzIsd6/XrrjGLXjeZ3D+H2aKX6Om4F+ZuWedy9w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dr5/qOKg/G8UAvNHgRVJC4233RWE5z7KRUn4v3oVWySNkIXfLuyh3UD8BwzIT9k79
	 4z6ro8J9CdB6IcA6NJAEQiwoT+sj30HzcZJYyrQN2bAW/xNaFKSjD2Yn6QEzxB1RQi
	 AZV8puytTgm7TN46BSAE1kpXL0/GWW2KckX45DfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E957FF8049B;
	Mon, 14 Oct 2019 19:23:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00EC8F80377; Mon, 14 Oct 2019 19:23:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADADBF80212
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 19:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADADBF80212
Received: by mail-ot1-f65.google.com with SMTP id g13so14443999otp.8
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 10:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JD69k1IYmv5zIeXa6Z5TEDaM3nDtNwvQeDBrSGHbMgQ=;
 b=pglcDplbnhDr129PAGc9mo6PEIfTDZThzDuPQd6czzw9ntRTuGRjhpttg7uEWu8yQE
 ZQbRa8c0b3C/bFqc7gnHEY61QNX8xvfkQh3haBoLgEV1N0EHVkquL6378UGzTvG/L9hj
 tvoPX6xiUgRC9yowuc4DfzU8DP57e9eZz+DvBl1tG4FCUs7Ip6vzaV3f140TTiNknwUq
 99m0EfUaYcPF4ypUSXmaVdtbXX904VU9s09oeGdHXNJi10mppplJ89HBMNZoZF4lfhZ7
 Rqq2jBod6L8fp3SMQc/H+CmuQMCq3oxdwU2tnl68nMag0DeUX4Y/F9vR5HI+ld8YKvyA
 yKEg==
X-Gm-Message-State: APjAAAV7dfU/RPIaNUPWkvT0KBjegIif9t6bpS/mA8wGFFXJHH/v3H1D
 hg0ufNs9ZId87wpMjDvCNA==
X-Google-Smtp-Source: APXvYqxHRdJmQOPrisxteYs0+w/NF0pxpsJM37YdctdK9XWzKLaQy61q28m3ATRWNm92Z8t2U3b56w==
X-Received: by 2002:a9d:7dd6:: with SMTP id k22mr1957125otn.256.1571073817986; 
 Mon, 14 Oct 2019 10:23:37 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x80sm5679259oia.37.2019.10.14.10.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 10:23:37 -0700 (PDT)
Date: Mon, 14 Oct 2019 12:23:36 -0500
From: Rob Herring <robh@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20191014172336.GA16992@bogus>
References: <20191014102022.236013-1-tzungbi@google.com>
 <20191014180059.09.Iec97a3f137148cdf316056612590b3e0b302f5f3@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014180059.09.Iec97a3f137148cdf316056612590b3e0b302f5f3@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, robh+dt@kernel.org,
 tzungbi@google.com, broonie@kernel.org, enric.balletbo@collabora.com,
 bleung@google.com, dgreid@google.com
Subject: Re: [alsa-devel] [PATCH v3 09/10] ASoC: dt-bindings: mt8183: add
	ec-codec
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

On Mon, 14 Oct 2019 18:20:21 +0800, Tzung-Bi Shih wrote:
> Add an optional property "ec-codec".  If specified, mt8183 could use the
> "wake on voice" feature offered by EC codec.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  .../bindings/sound/mt8183-mt6358-ts3a227-max98357.txt          | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
