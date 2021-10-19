Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4445432B9E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 03:57:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5470016C2;
	Tue, 19 Oct 2021 03:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5470016C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634608650;
	bh=ck9pE+IT7YBQOm5maMK6Ma4JlKr31Xo7erV64qa5K8U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GlvA2JCARCFKOTNAeXS61u3giYV1JrQLIKfWuGYV0BKXrDL16JlW5ZHw+eBwHNbev
	 FSZGKntGdb7qeCg9Th8NXoBP+aLLmGFDqThCscxpntA1cK82b6tXRT/gNqA/GKTyIx
	 5FbD/N/lvMqW1oJSdB4NzaHPjpwxRuJZtVqGbh6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A982F8026C;
	Tue, 19 Oct 2021 03:56:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B192F80256; Tue, 19 Oct 2021 03:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8743F80082
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 03:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8743F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="W/pHLIdz"
Received: by mail-pl1-x62b.google.com with SMTP id y1so12557160plk.10
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 18:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iVUwTST59wL6CTCRNw7c8eNLL6H7oNA2+TgO4Oeu8Y4=;
 b=W/pHLIdze3XNKJnt2F32rIzoajoraz7WOisrfpL79CoLKpEItyajbals9z4qH0/hSQ
 MsMbtVPgHEyXF9d7a3xx9ECfUPdJy2y579OmnaB/tB6WBX95IiVCR6MxX9PSuBAbn7MO
 zQwq05oS1sNCrzecgb6ysYxc7pc6bK+svtWUvUhrpbhDZ122h2OXN8AKTGwoZgbMyZIL
 hXgo8COOAhx79wDodOe6szSc8QUFQXW8scUbjGoyrW00w73tAi5VfY3dILcOfKlh6I4u
 jWAGRpBMBv06AErvnMP6nGKhZm3GxVX1GvKqmzwPJ75AlkysLku9NnFOTcylYAAb+T+e
 v9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iVUwTST59wL6CTCRNw7c8eNLL6H7oNA2+TgO4Oeu8Y4=;
 b=6+xldNCVeuzdoloWHWGU9b8jnkVPJ3HQYBiRBZvz0QhvSxDLX14IAZ6or94c547e1S
 eB7qtWVTnC9oUwu4DV/4gLLm4m5gxQXHdnY6Zd4KZA5iGTG9ukGmzUoz4seM2FUv6juN
 lG35DtjiW3rYbXmvQO5RFZKEEXUgqWpnFhA6Gaogfxp6BwJ8wn4+D3LDBS+C9VYGfPAB
 1vkeG8t8xe6RCtPiIgjkqjTEDfA6AE+bvDVp1F4m0BRciR3eBUObGnwraOeWQmeD7dTV
 qJUJmqZsYQvkldP7UnDet+1mEmFqPBHsjI37t1JtIXQjVBz4TvXQt0+xAuW8gGBW8vA6
 PkBQ==
X-Gm-Message-State: AOAM533F+UaqYcJ4rZR+I/MvzmuBNFnvfetwXrFsX9hb7dr7Hhnt3IG3
 k5EXPSB8dXzL+ywB/2bIpHk=
X-Google-Smtp-Source: ABdhPJxOmf2YCoKcCsPO1gg9ffjbe92LAOAJFoagIEVGnqtsbTEoNeSqP8nBMw+HX1IC3RE1OOfYEg==
X-Received: by 2002:a17:90a:3ec2:: with SMTP id
 k60mr3075137pjc.176.1634608543794; 
 Mon, 18 Oct 2021 18:55:43 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:54f8:9d9:1fa7:9eae])
 by smtp.gmail.com with ESMTPSA id oo9sm680504pjb.53.2021.10.18.18.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 18:55:42 -0700 (PDT)
Date: Mon, 18 Oct 2021 18:55:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 3/3] Input: axp20x-pek - Use new soc_intel_is_cht() helper
Message-ID: <YW4lnI2fAWBlIQhw@google.com>
References: <20211018143324.296961-1-hdegoede@redhat.com>
 <20211018143324.296961-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018143324.296961-4-hdegoede@redhat.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Gross <markgross@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-input@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
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

On Mon, Oct 18, 2021 at 04:33:24PM +0200, Hans de Goede wrote:
> Use the new soc_intel_is_cht() helper to find out if we are running
> on a CHT device rather then checking the ACPI _HRV field.
> 
> This is more reliable (some CHT devices have been found where the _HRV
> for the PMIC is 2 rather then 3) and leads to a nice cleanup.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please feel free to merge with the rest of the patches.

Thanks.

-- 
Dmitry
