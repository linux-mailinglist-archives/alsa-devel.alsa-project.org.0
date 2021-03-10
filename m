Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C20333C35
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 13:08:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 144531773;
	Wed, 10 Mar 2021 13:07:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 144531773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615378121;
	bh=GVRxbE5XCkimPxYjriDb+gFAOIRYYFsaiOlWdBVZhf4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eY7rphlt0hYj4tHB+N2aex4tCgOL7V8TBVIoFC1GlePw0Gnz6V0On3Wo1bwz1qxn1
	 86AGl7QU8ckf9r6SLlDplHh39Qv/lDLO27VtnnqPTH7Z2kOx6a9y0C+ni/AX3Vssji
	 TPEclmVIxT9ftvKGJv9zknN/xO+gg/kbdk6aRB6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 221CDF8016C;
	Wed, 10 Mar 2021 13:07:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17B54F801D8; Wed, 10 Mar 2021 13:07:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCBF3F8014E
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 13:06:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCBF3F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="rbBzgN3M"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79A7C64FEE;
 Wed, 10 Mar 2021 12:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615378010;
 bh=GVRxbE5XCkimPxYjriDb+gFAOIRYYFsaiOlWdBVZhf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rbBzgN3MceSCRkawOIYTVt/xQ29z/XcWin60DdHq+4t3a/B0LVY/mKbiokW4bZtoK
 oNix2OYalCr/M9TuKN90rPdlMW/qksckaZY45Ge7xU1GUFJiz/osyofoA15Qdkvh/E
 HShx3s9rSS1csqtcEqZmAwRrGfkkjbesqFz5Siv4=
Date: Wed, 10 Mar 2021 13:06:47 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: Intel: broadwell: fix mutual exclusion
 with catpt driver
Message-ID: <YEi2Vwid7ESsBRCb@kroah.com>
References: <20210309221618.246754-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309221618.246754-1-pierre-louis.bossart@linux.intel.com>
Cc: Sasha Levin <sashal@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 alsa-devel@alsa-project.org, stable@vger.kernel.org,
 David Ward <david.ward@ll.mit.edu>, broonie@kernel.org
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

On Tue, Mar 09, 2021 at 04:16:18PM -0600, Pierre-Louis Bossart wrote:
> In v5.10, the "haswell" driver was replaced by the "catpt" driver, but
> the mutual exclusion with the SOF driver was not updated. This leads
> to errors with card names and UCM profiles not being loaded by
> PulseAudio.
> 
> This fix should only be applied on v5.10-stable, the mutual exclusion
> was removed in 5.11.
> 
> Reported-by: David Ward <david.ward@ll.mit.edu>
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=211985
> Fixes: 6cbfa11d2694 ("ASoC: Intel: Select catpt and deprecate haswell")
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Cc: <stable@vger.kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Sasha Levin <sashal@kernel.org>
> ---
> v2: added Mark and Cezary tags, fixed stable address, added
> maintainers
> 

Now queued up, thanks.

greg k-h
