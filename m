Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADDD37A2E3
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 11:02:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E5B11694;
	Tue, 11 May 2021 11:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E5B11694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620723763;
	bh=8MHk4c1POf6mWMb0J1S6+OOhjRz36ZKLW2hZUHja9gw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tAJsXF3fv4gF8XS61Lgf5BAVFlhGwR+/+7e+T5n5SvoyNNrySflLNtDV1ijXCS/LW
	 mYXIDdw6dI3AXesGY2xjH9vvyKSJoAwCUQEX1lRKVt8O7zXaWMELYbUJoNOy5U4u1j
	 raudNx6G7CDMOV7UsIxDwEFTJSDL6wnki0TbKJ/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D3DEF8016B;
	Tue, 11 May 2021 11:01:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94E12F80163; Tue, 11 May 2021 11:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0798F800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 11:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0798F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="DeDz2zY7"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DBBD822205;
 Tue, 11 May 2021 11:00:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1620723652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8MHk4c1POf6mWMb0J1S6+OOhjRz36ZKLW2hZUHja9gw=;
 b=DeDz2zY7N/31baCj7EXxsFHs2mLwifW6kwbfrarDeqYxtLW/o94QiFI5P64Wek3BacKNFo
 f/HjWnTaPtL/AdM9m+/7Nd6sAlvFvQpbjlPQEESm8+zXelFL4ylFSmm9jrA0x0TgAOimsz
 jVAORYUURny3Np+cLJkrbuNkXYA22SU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 11 May 2021 11:00:51 +0200
From: Michael Walle <michael@walle.cc>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/4] ASoC: simple-card / audio-graph re-cleanup
In-Reply-To: <87im3qax4j.wl-kuninori.morimoto.gx@renesas.com>
References: <87im3qax4j.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <4c5b326d59d933ed4112f729139d4d43@walle.cc>
X-Sender: michael@walle.cc
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

Am 2021-05-11 03:15, schrieb Kuninori Morimoto:
> I'm so sorry that I didn't deep test on v1.
> I hope v2 patches has no issues on kontron-sl28-var3-ads2.

No worries.

Tested-by: Michael Walle <michael@walle.cc>

Thanks,
-michael
