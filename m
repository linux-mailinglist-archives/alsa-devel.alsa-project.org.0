Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ABE1024C9
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 13:44:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB10A168E;
	Tue, 19 Nov 2019 13:44:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB10A168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574167497;
	bh=Wo3x0+Akk76vnSvK98QZNdKambNBG3mmElH/XPKl79g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CVFH8aKHhLEBjkEuSd0XNH+VErbXK18efzlJ/usuKnpPjfh5zcL58S7pFFJHGXhtF
	 SntcSeSUo/r69wFYhLBCVODwbFvUFnnaijCqNpqJje6hcT9QikPzHLl1aHfVzRTkhk
	 F9JzlFdzi70Fo1PVaS8kNpZ5KHuXAftcJzyG3XiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E497EF80135;
	Tue, 19 Nov 2019 13:43:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33F7CF80137; Tue, 19 Nov 2019 13:43:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00F8EF800FF
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 13:43:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00F8EF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FsAKPrpG"
Received: from localhost (unknown [171.76.117.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C088A222B3;
 Tue, 19 Nov 2019 12:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574167387;
 bh=lAhWhgGASm5CohQIRPkZgnD7cqZs2/zHiuaF5IxWnKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FsAKPrpGUjQLjhgy7x4p7Cd2c3Uf7gtc/YshWtBQvsY4NOAUQsbvUl9B8CBXZIdB1
 VaEFHUU/UVjs+OigAp/bxaFr8pWbtB6rxrWV8nDi1HApkUeBefB2lA+mnEe2RVvSuW
 KBNPJDlBr/cKKFkyWdgQql41BtlTQPA1wfqYSIcE=
Date: Tue, 19 Nov 2019 18:13:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Message-ID: <20191119124302.GE82508@vkoul-mobl>
References: <20191119112625.GD82508@vkoul-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191119112625.GD82508@vkoul-mobl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [ANNOUNCE] fcplay: compressed audio test utility
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

On 19-11-19, 16:56, Vinod Koul wrote:
> Hello,
> 
> I have forked the cplay test app into fcplay which is a different repo
> [1] licensed as LGPLv2.1. The reason for fork was me getting sick of
> seeing the tool miss sync word for mp3 and no support for other formats
> which I wanted to test. But I was lazy to start exploring all media
> formats and write a parser for them so I have used libavcodec to the job
> for me which is GPL.
> 
> The fcplay links to libavcodec to get compressed audio parameters and
> then uses tinycompress to send data to sound card.
> 
> It supports mp3 (no more complaints about sync words) and Flac. I will
> add more formats, wma etc are in the list along with gapless audio
> playback and support for new changes coming to gapless audio playback
> as discussed in audio meeting at Lyon.
> 
> As usual patches are welcome.
> 
> Jaroslav, can we add to alsa-project github as well?

Here is the missing link!

[1]: git@github.com:vinodkoul/fcplay.git
https://github.com/vinodkoul/fcplay/

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
