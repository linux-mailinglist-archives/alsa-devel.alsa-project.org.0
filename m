Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E641E60CF8D
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 16:51:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66FA63311;
	Tue, 25 Oct 2022 16:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66FA63311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666709478;
	bh=VCltjqERKRXqiEIpoMVQ9binZrINHP3djXjLUsnrY/Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pIaINy+r5iDq9jXzHm+JCvW64EJzZ9KpFr5Mcsjv3nqshan0EZIOBPdP23bcNpUea
	 QCPyuu69aGsuOs2ohpIWW8aMphBCkusuHtoWq43WCappGOLQPaFXeu6PScPhILyxSw
	 RJrScQo3UqT+8YTUpOvTV9+jrAu7oJTct7Cp0EkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C3ACF80448;
	Tue, 25 Oct 2022 16:50:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C130F80431; Tue, 25 Oct 2022 16:50:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91DF0F80100
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 16:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91DF0F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="sPChzJNV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5DFEEB81D7B;
 Tue, 25 Oct 2022 14:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EC4C433D6;
 Tue, 25 Oct 2022 14:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666709413;
 bh=VCltjqERKRXqiEIpoMVQ9binZrINHP3djXjLUsnrY/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sPChzJNVdFp0eS17oqBoQV6rW+/XvI85cf5PLyQwbF0TnsSuv/BhDtqoqshmAjMxN
 SGfaZTjo+kAKd38XCblRNqbxEX3Z9mYImDfNHMXnvt3tUKjHbs+tkK04RKoqRvh4Ss
 J1xfZiUhXXqbMlsIH4r+nyyCOKf0SvajwNt9dyso=
Date: Tue, 25 Oct 2022 16:50:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH AUTOSEL 6.0 07/44] ALSA: hda: Fix page fault in
 snd_hda_codec_shutdown()
Message-ID: <Y1f3opiid6pvKINq@kroah.com>
References: <20221009234932.1230196-1-sashal@kernel.org>
 <20221009234932.1230196-7-sashal@kernel.org>
 <24d084e1-700d-da77-d93e-2d330aac2f63@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24d084e1-700d-da77-d93e-2d330aac2f63@linux.intel.com>
Cc: Sasha Levin <sashal@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, tiwai@suse.com,
 alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 mkumard@nvidia.com
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

On Tue, Oct 25, 2022 at 09:27:32AM -0500, Pierre-Louis Bossart wrote:
> 
> 
> On 10/9/22 18:48, Sasha Levin wrote:
> > From: Cezary Rojewski <cezary.rojewski@intel.com>
> > 
> > [ Upstream commit f2bd1c5ae2cb0cf9525c9bffc0038c12dd7e1338 ]
> 
> This commit on linux-stable seems to have broken a number of platforms.
> 
> 6.0.2 worked fine.
> 6.0.3 does not
> 
> reverting this commit solves the problem, see
> https://github.com/thesofproject/linux/issues/3960 for details.
> 
> Are we missing a prerequisite patch for this commit?

Please see https://lore.kernel.org/r/20221024143931.15722-1-tiwai@suse.de

Does that solve it for you?

thanks,

greg k-h
