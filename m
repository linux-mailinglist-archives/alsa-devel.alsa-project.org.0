Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EC94DAD56
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 10:18:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE0D9175A;
	Wed, 16 Mar 2022 10:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE0D9175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647422332;
	bh=KDzkJMkMwQtqxQPGrKxvlOXkETOc6M8J/9JQ//bf+1E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jl4xC5AWGdtSHe4UHFFeh2+agJD9oN0XDRZlaKxICh1XY6SOXMJ+JXR5DdowHQtQZ
	 y7fP8m405E3S8I7QMgN/6Xv3BbE+19zYK7bAluGvEamLskPcnXshcwyqEVjqhc9Sq4
	 Q4tjEAxF9fr/FCXFgQyFTT4JrrgecvZBnQJdPtGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3360FF801F5;
	Wed, 16 Mar 2022 10:17:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19458F80095; Wed, 16 Mar 2022 10:17:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bitmer.com (49-237-179-185.static.tentacle.fi [185.179.237.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 066CDF80095
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 10:17:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 066CDF80095
Received: from jarkko by bitmer.com with local (Exim 4.89)
 (envelope-from <jarkko.nikula@bitmer.com>)
 id 1nUPmO-0007RG-Tx; Wed, 16 Mar 2022 11:17:16 +0200
Date: Wed, 16 Mar 2022 11:17:16 +0200
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH] ASoC: ti: Fix spelling mistake "cant" -> "can't"
Message-ID: <20220316091716.wk25xjliy4zzvzb3@bitmer.com>
References: <20220315230816.2964577-1-colin.i.king@gmail.com>
 <4d3c65c0-1bc3-bc8f-393a-22c964f18120@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d3c65c0-1bc3-bc8f-393a-22c964f18120@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Colin Ian King <colin.i.king@gmail.com>
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

On Wed, Mar 16, 2022 at 08:34:12AM +0200, Péter Ujfalusi wrote:
> 
> 
> On 16/03/2022 01:08, Colin Ian King wrote:
> > There is a spelling mistake in a dev_err message. Fix it.
> 
> Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
>
Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
