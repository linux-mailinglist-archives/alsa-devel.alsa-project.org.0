Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5CE74F47
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 15:26:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 944141EE5;
	Thu, 25 Jul 2019 15:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 944141EE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564061167;
	bh=ICK6ILoN6tzoCmjtTrUodM7ee6hhpEmJJBcKj1ut1s8=;
	h=From:To:In-Reply-To:References:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nz9FfvKPjip4Q5SgbvrMUah5i7LZmFksaJoPJZHQlC6xhCGmP1T5/9MWC3uIMSgH/
	 qoNz6V9uqbKF0s2mt2cZfnWMs/JkJXUBP9+RwfUA3eKAksSQKD0S/ZoLVIk6yoxXv6
	 ElpZ7PfF/9RtizqdEPIkf22DpeSusP4dad1bIDpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CBF8F80447;
	Thu, 25 Jul 2019 15:25:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA1F2F80392; Thu, 25 Jul 2019 15:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFC15F8015A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFC15F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="D5N9xFES"
Received: by mail-wm1-x343.google.com with SMTP id a15so44998783wmj.5
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 06:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=6aDJ94uyyhxgWSyExse9QYlquEyyOJ9JE7SxUePnMhA=;
 b=D5N9xFESPh6uCOxGlZuTzAA4mb7oWHRhDyTjlYtFlwi6bJdhcbNT5E59VtjKhctWnn
 WdkJDf7qZM6dH8RhDOONw43oJBVvhk44/kZjXkF71AncceV6SsngmzIu48GsS/b2XqQo
 l6JJY+duWSKVwsmsptTyrXnzjpENPoQ2DL8Q3TcuNpihHyUaeSlxw+onu3zGEpFbnT91
 hHoJO8pSkk7svMhzZo2foJg5rEyD2QvGIQJTsJJXuAkUenK4O9J3vG1S7kxcH7aX10j8
 FPkQCcXcehBkj79s3Upnry4gyUmatXOHp1WPmbIHRGmmXDWYeBwwQWKnqvK30Z9kbiR3
 eQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=6aDJ94uyyhxgWSyExse9QYlquEyyOJ9JE7SxUePnMhA=;
 b=SIrcHh4qAfEniSXNU+P4MCrGx/q6vzLLerVdP6NhObTbkYLSqod1gue1IKaWhn6VLF
 eoZ9oAptrpKQgcI98rU5TFP5/Maqgb0GIJjgPr6diakyMZzE+WK4dS+6JpCBc2ISIEZw
 QBIe3fddlaXu82nxY36GUsssyBRrg1kqmfz7iX8d4OiIg7cAF721IzN7unXaNsVtG2qk
 G9vSR85KQpcVy7I1k6Z+V0wVtDJzpRghHK4c10hkEx0E36ztbslRx/UCIIQ+vZRulOg2
 fmjVyCuojReeJD5A7rwy+nbzhG6hH+PO468WOBN9NcCt1+lPC3egXMajYA1KFsE/hnXo
 9RIQ==
X-Gm-Message-State: APjAAAUhxfKCi2AuX9+n/2deWXe11ODQbWPf9aFXNQtzqkWRDptBcJMz
 kVzZ9AwdbJ3zkkwgbI0GtEfDqQ==
X-Google-Smtp-Source: APXvYqzkB7UJ5b3t6lNCXexFXjlZMe0BgyF3qfh59IwBeXFA97QLF/U3xl/ncqsPvbVWUg8lQVWfpA==
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr15113128wml.124.1564061111601; 
 Thu, 25 Jul 2019 06:25:11 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h1sm35852177wrt.20.2019.07.25.06.25.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 06:25:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20190725125534.GB4213@sirena.org.uk>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
 <20190724162405.6574-4-jbrunet@baylibre.com>
 <20190725125534.GB4213@sirena.org.uk>
Date: Thu, 25 Jul 2019 15:25:10 +0200
Message-ID: <1jimrqxn49.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 3/6] ASoC: codec2codec: deal with params
	when necessary
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

On Thu 25 Jul 2019 at 13:55, Mark Brown <broonie@kernel.org> wrote:

> On Wed, Jul 24, 2019 at 06:24:02PM +0200, Jerome Brunet wrote:
>
>> Also, params does not need to be dynamically allocated as it does not
>> need to survive the event.
>
> It's dynamically allocated because it's a pretty large structure and so
> the limited stack sizes the kernel has make it a bit uncomfortable to
> put it on the stack.

Ok, I'll revert this in v2
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
