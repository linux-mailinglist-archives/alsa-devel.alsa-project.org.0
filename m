Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 233A821DDD1
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jul 2020 18:46:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F4781663;
	Mon, 13 Jul 2020 18:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F4781663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594658799;
	bh=Ld30GCztW6l8oAVSc8DOStp1yRmHJK50JAMW5hEiYGs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TWKrlfLPKKKEzCbOIA+kkY0qBNOVnsJC+WiQzmw7aMKYYMNXscm5GA6836ahTAyFf
	 tR89POOkYV62oNFTzw9Dd0bYvA+fQWC+z1uROalF0rW8v0YSthY2tyoXmv9PF+ZExL
	 9vjs+m8taflOFg4viuwXr4tMVBvBi88FbkudujTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1382F80227;
	Mon, 13 Jul 2020 18:44:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AF48F8021D; Mon, 13 Jul 2020 18:44:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89283F800E5
 for <alsa-devel@alsa-project.org>; Mon, 13 Jul 2020 18:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89283F800E5
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 4B92141A48;
 Mon, 13 Jul 2020 16:44:43 +0000 (UTC)
Subject: Re: [PATCH 1/3] ASoC: rsnd: don't use discriminatory terms for
 function names
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87r1tg3swv.wl-kuninori.morimoto.gx@renesas.com>
 <87pn903svl.wl-kuninori.morimoto.gx@renesas.com>
From: Hector Martin 'marcan' <marcan@marcan.st>
Message-ID: <9819df17-228b-78e4-3de8-71344292de01@marcan.st>
Date: Tue, 14 Jul 2020 01:44:40 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87pn903svl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 13/07/2020 14.08, Kuninori Morimoto wrote:
> -u32 rsnd_ssi_multi_slaves_runtime(struct rsnd_dai_stream *io);
> +u32 rsnd_ssi_multi_followers_runtime(struct rsnd_dai_stream *io);

I don't have full context here, but AIUI this is about bundling 
different links together? If so, primary/secondary or main/secondary 
might work better than leader/follower, in my opinion. The latter 
implies more of a "one device follows another one" scenario, like for 
clocks.

Just my 2c. Ditching the horribly ambiguous master/slave terminology is 
a good chance to pick the replacement that best describes the situation :-)

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub
