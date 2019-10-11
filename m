Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4559CD43F6
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 17:16:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B67971683;
	Fri, 11 Oct 2019 17:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B67971683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570806993;
	bh=u+9ilYV3fbQsVOwKDlyC4g9DTyQxbNjyvcUXQNzRTTw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QiaLlvecsyUybP98phiVmiH8rMcLR+n4Ch/gRBk/2a4M9mb0bjaq/mmpcz0p7Cf8Q
	 8024Sygvhq4Ciw0UDPRApvz4t/GMgqNFJt4eAw0x69p922eYX6vew9D1NY0uYyeIow
	 RyRyhDE9gkeOOr85799GqBy87/icbXjJQBdC2f7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17472F805A8;
	Fri, 11 Oct 2019 17:14:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE867F80323; Fri, 11 Oct 2019 17:14:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80933F802FB
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 17:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80933F802FB
Received: by mail-ot1-f67.google.com with SMTP id y39so8251040ota.7
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 08:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W01GRpRBdQLkNYt/6/DmE6Y13Qt+kQqmJcdbIFQHXv0=;
 b=noEeVEjSp+gCueFFiyIik/vSxM6RRP1EEBQkNNSs9KL6X8z6XTvNYwwbsGlC84AVm0
 hsXLFmIeloIAHRVTIFsHGgrNmZkoFpqcQcU6AIBiKuZiMC8iecpajVXSJWBMxk+AW8o5
 AEWgkf8l8dEgRhlacTmn/qdpl0KIzVNGQ0FZ83/vTG+8hlm3IJVzLuCVAWbho9R83gDL
 58rmMuw/ref19apR9r9HDsEiGR6ZnqrJYemNiBnMqwkx3/IgoMCFB3aszxamR8X/VUJv
 gJJM2pAW++l9XBjVNP+R4I/FBZK7HkyGfLp9VTaCHwnBQ9fKmAB91EhS6GPS1xKjxuEe
 dcdA==
X-Gm-Message-State: APjAAAXoFVUuFGqvlzBru2UrmTmH3qqXcSj4P4vEUIL7VKs5q3sTSJcV
 dR1TQe33xMAMvxAFkngGxA==
X-Google-Smtp-Source: APXvYqzhey1oOTnA0w0d9o/KuIH33dNcRfhzSqT0Ru6dq2J5unDcqbcklT5cAwpziCP+n3Kod/dEqg==
X-Received: by 2002:a9d:7a8d:: with SMTP id l13mr12194525otn.351.1570806847891; 
 Fri, 11 Oct 2019 08:14:07 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d69sm2726364oig.32.2019.10.11.08.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:14:07 -0700 (PDT)
Date: Fri, 11 Oct 2019 10:14:06 -0500
From: Rob Herring <robh@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20191011151406.GA18450@bogus>
References: <20191005085509.187179-1-tzungbi@google.com>
 <20191005164320.05.Id4657c864d544634f2b5c1c9b34fa8232ecba44d@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191005164320.05.Id4657c864d544634f2b5c1c9b34fa8232ecba44d@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, robh+dt@kernel.org,
 tzungbi@google.com, broonie@kernel.org, enric.balletbo@collabora.com,
 bleung@google.com, dgreid@google.com
Subject: Re: [alsa-devel] [PATCH v2 05/10] ASoC: cros_ec_codec: read max
 DMIC gain from EC codec
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

On Sat,  5 Oct 2019 16:55:04 +0800, Tzung-Bi Shih wrote:
> Read max DMIC gain from EC codec instead of DTS.  Also removes the
> dt-binding of max-dmic-gain.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  .../bindings/sound/google,cros-ec-codec.txt   |  4 +-
>  .../linux/platform_data/cros_ec_commands.h    | 43 +++++++++++----
>  sound/soc/codecs/cros_ec_codec.c              | 53 ++++++++++++++-----
>  3 files changed, 73 insertions(+), 27 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
