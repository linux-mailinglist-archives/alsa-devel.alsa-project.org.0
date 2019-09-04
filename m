Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18318A7F2C
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 11:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0707169C;
	Wed,  4 Sep 2019 11:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0707169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567588850;
	bh=g+B2Sag/XDD3+HX8Nyfl+5Yiu2152AWO4Jvail5BvLs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uDf8R+GUqWYN9dZ6pbm7G0g+IKje402dE81ownurR+xsdJVT25t3Q+vJ+DDINwxBt
	 xVDis0QeRMLm99vaG5CCv3nmvZYAHBzfQXgJbzejLJ2mVCh4T7AQeZZe7lQsaUY0Xa
	 B+w9obTRqsJ4eeScnx9uIKvoGRPnRlMxVt++D+tE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75BD3F803D0;
	Wed,  4 Sep 2019 11:19:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38686F8011E; Wed,  4 Sep 2019 11:19:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAD30F8011E
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 11:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAD30F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XIMGFJYN"
Received: from localhost (unknown [122.182.201.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B36ED2339E;
 Wed,  4 Sep 2019 09:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567588738;
 bh=7PzKPrjPE7DWvXFVkG19p3ZhwppOun+obg1xPknZeh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XIMGFJYN/c9Priq9kIntyPSDcG6WH4kUNT+46l6saWjhvSQyj/f5ZrvDO+0Ho8LJ3
 h2K9O6cICd6NzEVdRklNKNI3k7N7gNJYbm0hMvbAAfsHsEjGRc8PlbtdLbnfDGvx+G
 PLp2KgWCosEkXpHb2A+T6NuLyvNsMauC6vNVoCLQ=
Date: Wed, 4 Sep 2019 14:47:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190904091749.GM2672@vkoul-mobl>
References: <20190829163514.11221-1-srinivas.kandagatla@linaro.org>
 <20190829163514.11221-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829163514.11221-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v6 1/4] dt-bindings: soundwire: add slave
	bindings
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

On 29-08-19, 17:35, Srinivas Kandagatla wrote:
> This patch adds bindings for Soundwire Slave devices that includes how
> SoundWire enumeration address and Link ID are used to represented in
> SoundWire slave device tree nodes.

Applied, thanks

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
