Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1878D48564E
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 16:58:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF1C6194A;
	Wed,  5 Jan 2022 16:57:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF1C6194A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641398288;
	bh=3CZ894pNjI4R6ogj9PWaXloa9+b767wEtzKfKZhUGQk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gYqZDFstqlzTw1iLkHXBUy0Ca3x5pmkN07dVZV4SpVhOtsv6oH76biSAjms6FQpaj
	 YfZx+I0TWz+VV0Artth1cOTsp6vd//cX1GCregfXH+mXgV7phFnGZ7LKE7cjyajV47
	 rSbtQZ0yPB8dAnX4/kNypVIQNCWjkSnK5DoqL4/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BE56F8028B;
	Wed,  5 Jan 2022 16:57:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDC3EF801D8; Wed,  5 Jan 2022 16:57:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B73E8F8007E;
 Wed,  5 Jan 2022 16:56:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B73E8F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZnqDSs+C"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A72DAB81C13;
 Wed,  5 Jan 2022 15:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD92C36AE0;
 Wed,  5 Jan 2022 15:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641398211;
 bh=3CZ894pNjI4R6ogj9PWaXloa9+b767wEtzKfKZhUGQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZnqDSs+C5Axn86ynbBo7l9wViDnwnt+DtLuYRoNg0ZFs79ViCJapF4F/0vz5GqPaB
 4cvLsvk+XkKaguN2zaOloxE+2EuyIdNq7iik1OeHjclNLxlCYCsz5dHKazPyaHis+r
 OvzMnIYKd2xebFaFBCYCrXUTAxxbUjWFvw4cpM84pXx0TLiriI8RXsHKAaovVGOerQ
 lCEG8KNnYVCkgkAuXxVJrUTT76inSGy1927zzqT4Ewi5vQqrHhuxUlGrJIbH+hogzC
 ZbE1+24AGaGWMBku74CrDITUWcxIvT8ABxVRaLmJcA8ZiHCezkTfHWLlSAxsOhKk9K
 2CGQNFCbQLL+w==
Date: Wed, 5 Jan 2022 21:26:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: Handling SIGTSTP (Ctrl+Z) /SIGCONT/fg with aplay/cplay
Message-ID: <YdW/v6qFoWAg8YWT@matsya>
References: <CAEnQRZB3gp3DwemnTwzbq78pxxpeU-TR=KjSKxgWowFmf+_bXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEnQRZB3gp3DwemnTwzbq78pxxpeU-TR=KjSKxgWowFmf+_bXw@mail.gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, sound-open-firmware@alsa-project.org
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

Hi Daniel,

On 05-01-22, 16:31, Daniel Baluta wrote:
> Hi all,
> 
> Is there any quick document for handling Ctrl + Z with aplay/cplay?

cplay does have have handler for it, patches would be welcome :)

> I don't see this signal handled with alsa-lib or tinycompress although
> linux kernel offers PAUSE/RESUME ioctls.

Are you sure, I checked with aplay, it seems to me work for me on Fedora

$ aplay test.wav
Playing WAVE 'test.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Mono
^Z
[1]+  Stopped                 aplay test.wav

It did pause the file and I was able to resume it from the last
position.

FWIW:
$ aplay --version
aplay: version 1.2.6 by Jaroslav Kysela <perex@perex.cz>

> 
> What should be the expected behavior?

Pause the stream should be apt behaviour, unless Takashi or Jaroslav
have better ideas

-- 
~Vinod
