Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E955EBA9
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 22:31:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 855021669;
	Mon, 29 Apr 2019 22:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 855021669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556569877;
	bh=u1qDTc9skoUXUEHaAghQIRbKHQw8/cx/n+MOrrpzrFQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QdxvZElw3XSlQ5ysTU5eQ0VnGl0BmILf6m3HEBhdQhfZWxMXb0zn3lc3K9CTvmOq1
	 hX32HD7JaqFg9+/zNBdXwvrB0yYLoJPuQusRTYNkIiaXmrLwaJg+GeyL7cfG+8tUy5
	 UbV50Jn4CJ6nPzMvvdV1ptSxNjIDJrYksaUBvzhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50FE8F80CAB;
	Mon, 29 Apr 2019 22:29:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEE88F80CAB; Mon, 29 Apr 2019 22:29:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF9D1F80641
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 22:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF9D1F80641
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Zeho+7d9"
Received: by mail-it1-x142.google.com with SMTP id z4so1158474itc.3
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 13:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=gjJLmWfpxows7aW1jhatibycH4OFy3vLBDbKlm8gSAA=;
 b=Zeho+7d9i7VcjwlxdD8Deh5bImiRNmsyTYbk3bCYu4iGzUhUOA5AwLKaEt9stl6zpi
 KsAFbi+5yKwlA5Z0qVUj8GXxxjoJyIQp2h/QJX7c3UFS2pxgiChTOKT3t73fG6oHHxwM
 eAThpBK3nHylMQeUY30wYGPNLxS8QJf6TtTTkFVz950nIDAaLH6b3mfg2xYkZjshnRO4
 to2B5n8XKMvLo/lYeu8Wr+ehmR0WE98j8N3YTD+PSitw5STOLaVFimeoHwTlHsA+3dtg
 pwSWRs2RiKNf5azkDBxtD6xxxxovdfgGDcljpekKuyP4jyKEc3ml5RsU9suJ7IignqKr
 tddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=gjJLmWfpxows7aW1jhatibycH4OFy3vLBDbKlm8gSAA=;
 b=P9S04uCNKiCEV/eRE4HJtGv0FLyTNWlt0m5XYNwNnU2AKQ459dDVJAd6RQX6ipF7ah
 rdK7xPWRs7gH3hk6Nx0TQDaLWEVXvU+QVUdj6dsT/dQs7hg7gSHo6eE2YkGkIyJJC96M
 DhGHi8/eBFQZb1k7rX/JpeGkJcL67EfRAMhrnQOZs/dufLbLgCHr8afFeDiIWJ+zY/+y
 CM324uSmjE4TMJZ0LSZkC7MVL6cwabSWhO52Gm62ayIy3ozeI2QS3mFnQ0GTupmKdJbN
 W4NpYCYgFkRsSgHB193d0kp8Fr/322e9Rzmig608hPl3rgA9Q5tz+eNl1T69OAbkXOpC
 51Sg==
X-Gm-Message-State: APjAAAVwPlqgBa74R9vkgLikNIFiWLHH9bfqExrauoMikZh5wY/OZTQq
 2NjjTNNqpGWy4IfZZRQG9DeAj7kM3fI=
X-Google-Smtp-Source: APXvYqwlElYNVvw2estkV95iygTziVEjExHbaT0HL/tDZLWRmHHNJIzRt3OODZek0hqJPIug8kSvQA==
X-Received: by 2002:a02:760b:: with SMTP id z11mr37812522jab.139.1556569761891; 
 Mon, 29 Apr 2019 13:29:21 -0700 (PDT)
Received: from google.com ([2620:15c:183:200:855f:8919:84a7:4794])
 by smtp.gmail.com with ESMTPSA id x5sm790520iop.81.2019.04.29.13.29.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 13:29:20 -0700 (PDT)
Date: Mon, 29 Apr 2019 14:29:18 -0600
From: Ross Zwisler <zwisler@google.com>
To: alsa-devel@alsa-project.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Message-ID: <20190429202918.GA35915@google.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [alsa-devel] Correct git tree for ALSA development
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

Hi,

I'm trying to ramp up a bit on ALSA development, and I noticed that many
sound-related entries in MAINTAINERS still refer to alsa-kernel.git hosted on
alsa-project.org, i.e.:

BT87X AUDIO DRIVER
M:      Clemens Ladisch <clemens@ladisch.de>
L:      alsa-devel@alsa-project.org (moderated for non-subscribers)
T:      git git://git.alsa-project.org/alsa-kernel.git
S:      Maintained
F:      Documentation/sound/cards/bt87x.rst
F:      sound/pci/bt87x.c

From the alsa-project.org pages:

https://alsa-project.org/wiki/Download#Developers:_GIT_access
https://alsa-project.org/wiki/GIT_Server#For_developers_-_kernel_drivers

it seems like current development/maintenance actually happens somewhere else,
possibly on Mark Brown's kernel.org tree?

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/

If so, should we update those stale MAINTAINERS entries?

Thanks,
- Ross
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
