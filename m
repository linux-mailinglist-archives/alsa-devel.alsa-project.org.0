Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 689BC1B2F2B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 20:33:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BBC116CE;
	Tue, 21 Apr 2020 20:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BBC116CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587493998;
	bh=EP/gCKpsGZmYh2kMLgqffPiBsUftTtAW7qOXt/03XG0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NyqzmDfiBklPX57E6fHfQnuC8TgRho6EC75KwanBZ4ni0aZqKE3zWbsoHqOpdxerl
	 bVcN9EAxZtaGbN3bmJPKbtuck9aDwT9CXlOHjZSJy08WDhSoV3aS/5KmUvnnE46qGu
	 Od7RofyRClgayLcTCWvLu4vWb+bEMCKea+Ua+1Pw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 392E4F8012F;
	Tue, 21 Apr 2020 20:31:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C0FEF801EC; Tue, 21 Apr 2020 20:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by alsa1.perex.cz (Postfix) with ESMTP id 531D8F8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 20:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 531D8F8012F
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1jQxg7-0003e1-00; Tue, 21 Apr 2020 20:31:27 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 28A08C024B; Tue, 21 Apr 2020 20:31:11 +0200 (CEST)
Date: Tue, 21 Apr 2020 20:31:11 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] ASoC: txx9: add back the hack for a too small
 resource_size_t
Message-ID: <20200421183111.GA20471@alpha.franken.de>
References: <20200421171136.288216-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421171136.288216-1-hch@lst.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, linux-mips@vger.kernel.org
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

On Tue, Apr 21, 2020 at 07:11:36PM +0200, Christoph Hellwig wrote:
> Looks like I misread the Kconfig magic and this driver can be compiled
> into 32-bit kernels.  Add back the hack to extent the range of the
> resource_size_t, and include the header with the txx9-specific ioremap
> magic for that.
> 
> Fixes: acfaaf52ebfd ("ASoC: txx9: don't work around too small resource_size_t")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  sound/soc/txx9/txx9aclc-ac97.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
