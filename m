Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5EF17BE02
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 14:17:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 235D615E5;
	Fri,  6 Mar 2020 14:16:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 235D615E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583500649;
	bh=E/f+bLvJLqlhlD+mFGhRfo1gCXWCKu7vlRaUNiP7+Ew=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vftHGt7hxQexgufpgAEMTOHlSglb+LOldxlBdVSbuyjtZcu4j/T9xL1bP7qoeRYlq
	 nILLYzjItl2fFHGevYkW0sVNU0foPy5+w39q7a+6c8MN1ghCC14y+lML3We667SPJX
	 KVQqM7K2Eqj0Si3hJgKVfPs37YR3alU+Nxgab4J4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E2A9F8012D;
	Fri,  6 Mar 2020 14:15:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C71DF801ED; Fri,  6 Mar 2020 14:15:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D42AF8012D
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 14:15:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D42AF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="urcIwNto"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25D87208CD;
 Fri,  6 Mar 2020 13:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583500540;
 bh=E/f+bLvJLqlhlD+mFGhRfo1gCXWCKu7vlRaUNiP7+Ew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=urcIwNtosruNBfci/IOqGg7iZ3A1Uv/iHVPYEzTcGAFBZNzUommtj4TISKc/DTVSD
 hPXcoZOHaFmJ1hFyF9CE5Z83ZtT/gwj4YvXvZsGXrE6bGniufVDsEjIejhf8PJB+JX
 RAOhcF8KmzAVKi4L64Y7ZU2R8NNSaqACXEeRruvo=
Date: Fri, 6 Mar 2020 08:15:39 -0500
From: Sasha Levin <sashal@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: 5.5.y - apply "ASoC: intel/skl/hda - export number of digital
 microphones via control components"
Message-ID: <20200306131539.GO21491@sasha-vm>
References: <147efa37-eb57-7f17-b9eb-84a9fe5ad475@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <147efa37-eb57-7f17-b9eb-84a9fe5ad475@perex.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org
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

On Wed, Mar 04, 2020 at 04:25:54PM +0100, Jaroslav Kysela wrote:
>Hi,
>
>  could we cherry-pick patch 8cd9956f61c65022209ce6d1e55ed12aea12357d 
>to the 5.5 stable tree?

Queued up for 5.5, thank you.

-- 
Thanks,
Sasha
