Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C30FB4CB766
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 08:05:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 537701A00;
	Thu,  3 Mar 2022 08:04:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 537701A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646291135;
	bh=MWqEM1UWVeEsmwGRjNNxoFoL6FWksos5IdS13YIpRRA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SrX7H5FOB/34FCiVCmB7faFjir+wgsR1E7lyS0hp3UOxXd3BSX/+fwzVNp7v2hrIT
	 fc/9+hKssau/iK2n1GlPrq4RfBD8pTS5QRBA4YsvbYWR9evzNKxqUl2kjaBdWC5PlW
	 HHOyzER4SEOyDWoURLq5grHUwuSShAMTejR2En/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB86AF80518;
	Thu,  3 Mar 2022 08:03:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4E98F801D5; Wed,  2 Mar 2022 12:01:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 802CFF80154
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 12:01:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 802CFF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="ilcPuStk"
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8BBEB3F5FE
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 11:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646218895;
 bh=Si9sQ7yLz6JK6Nen6lACTBVX2ecHMiwS0ByLXYRxjJA=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ilcPuStkkOSXcrQlPpgyR3RC0LVaMRHDnDtwKcf/x0PpMKYEjsDD7cQJxuAr5SIrK
 5z2zkx4PJCe7j1EX18NJg9igSjx2ka5eVTyyr7Re+IzksWWCCb2r2xkJLdkwI6owGQ
 uIyVgu6dRPwrnXc97TZheCvA9uXwMK3IiJOv+MRVHSfimjjVH+DW7cahaVDwRLANn3
 jb++Bx+2TQ59B4cTYLISiBBMbRHZTcoohn40zcWKR34MCJlZX46zhMMjBAGpBU2ms9
 yr8o4xpM2KgDEVjdywtHVBrJwI4o44GyJVUqsF3WTHb3IYEPRYdYfASM3eW+k0CrLL
 jcLLE9X9/vpig==
Received: by mail-lf1-f72.google.com with SMTP id
 m18-20020a0565120a9200b004439214844dso589284lfu.9
 for <alsa-devel@alsa-project.org>; Wed, 02 Mar 2022 03:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Si9sQ7yLz6JK6Nen6lACTBVX2ecHMiwS0ByLXYRxjJA=;
 b=dWXfViSQjqASLgtw3QkwJQ4w4NSroidtJSB5ruhCnZoiBwgDjWP0ve3ONtrniTsoNp
 FPK7fka/FzPhrjcyjYH84FxusZd6Jj7pXIaif3t/GI9hAfmuobg2DoIkrd7Eo5NcZ9eb
 a91a5n9tNhKGOKDzDa0c8B/pWsMvFoPm9I5iqhY7HxFJYNPG0cJI38g9wUlbZELeyJYH
 QriUi5kwSofAAMU+0TQs3xuA9SmbjdbpCl5CaXzqE5jlXW60eQVe3C9Z7p+ddxVdPyRA
 InCsaE+M9Ktam+XxR2putRR9zwg++U92m+q/5OB98zdYhbhhSOHSDll4vpvcfMMLxC2L
 VzlA==
X-Gm-Message-State: AOAM533HXNOjiIOENwaIiTri4i4C2oAEdzX61UvyIS7I7k59G385JRap
 4IhqE8Blp/FyTs8ol59EWBqmlSgdeEhjC6mBr4wnmyc8Io3hj99qxQzA2IZhJJTBGd89QKkSdGL
 qJv0T3XU92mdFe2v04/k3x0XsSN2mtwdGIGZ2Kkt1
X-Received: by 2002:a05:6402:369a:b0:413:81b5:7b64 with SMTP id
 ej26-20020a056402369a00b0041381b57b64mr22935760edb.163.1646218881615; 
 Wed, 02 Mar 2022 03:01:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaXIpVKlG8abGyix74I9rTqmFoJz7zygw3QnLROE8hwqkRWj9/wBCxZT5ACGsypW51MBpi7Q==
X-Received: by 2002:a05:6402:369a:b0:413:81b5:7b64 with SMTP id
 ej26-20020a056402369a00b0041381b57b64mr22935729edb.163.1646218881424; 
 Wed, 02 Mar 2022 03:01:21 -0800 (PST)
Received: from [192.168.0.136] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 et3-20020a170907294300b006d6534ef273sm5617821ejc.156.2022.03.02.03.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 03:01:20 -0800 (PST)
Message-ID: <22099da9-fad0-a5fb-f45a-484635ca485f@canonical.com>
Date: Wed, 2 Mar 2022 12:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 06/11] s390: cio: Use driver_set_override() instead of
 open-coding
Content-Language: en-US
To: Vineeth Vijayan <vneethv@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
 <20220227135214.145599-7-krzysztof.kozlowski@canonical.com>
 <b2295eba-722a-67e2-baae-20dac9d72625@linux.ibm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <b2295eba-722a-67e2-baae-20dac9d72625@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 03 Mar 2022 08:03:25 +0100
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
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

On 01/03/2022 17:01, Vineeth Vijayan wrote:
> 
> On 2/27/22 14:52, Krzysztof Kozlowski wrote:
>> Use a helper for seting driver_override to reduce amount of duplicated
>> code. Make the driver_override field const char, because it is not
>> modified by the core and it matches other subsystems.
> s/seting/setting/
> 
> Also could you please change the title to start with "s390/cio:"
> instead of "s390 : cio"
> 

Sure, thanks for review!


Best regards,
Krzysztof
