Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59959FE2E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 17:23:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37BE5201;
	Wed, 24 Aug 2022 17:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37BE5201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661354635;
	bh=Xu7LCdyMGn+McwuXQcjzobThUsINws7xLr2XHKj0nNo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X03ToJP/Csf6crhjNLSoD6w+51vxxAv1qWMzoM2LcgkgWoZ9N8y9bOF3cqMd0TqDO
	 Xm0B+o6F4NPSH3wwv3UBvIVVQsf0plLKfS5QnXK0eMhK1DtgotwPR3WjndlH6ealG2
	 IXpmWrmQR7z1cxcR+oQr7mIDx5J08gNq2edF7qLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A37E0F804CC;
	Wed, 24 Aug 2022 17:22:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC9E1F804C1; Wed, 24 Aug 2022 17:22:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA57DF8014E
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 17:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA57DF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="lDkZMcwa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1B18BB82572;
 Wed, 24 Aug 2022 15:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F306C433C1;
 Wed, 24 Aug 2022 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661354560;
 bh=Xu7LCdyMGn+McwuXQcjzobThUsINws7xLr2XHKj0nNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lDkZMcwagdoURaR+jm24a+ohs1u+RX+U7TEQbISwiBnOzC3gKi0sLdglVz/S+pPO4
 5eGIb0gqEW3fH6BZ2Qz6BWy5ihyAt97ds6xvqUBcm6xtMEzb+joFOHLLT81kUkuxuP
 dtdWi7a3I85psdFyxh9hLwA+9+b9aAclXhqJvEaU=
Date: Wed, 24 Aug 2022 17:22:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 1/6] sysfs: do not create empty directories if no
 attributes are present
Message-ID: <YwZCPdPl2T+ndzjU@kroah.com>
References: <20220824135951.3604059-1-gregkh@linuxfoundation.org>
 <fb3a66c6-a8b3-02db-4170-5d5c521165e2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb3a66c6-a8b3-02db-4170-5d5c521165e2@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Wed, Aug 24, 2022 at 05:17:44PM +0200, Pierre-Louis Bossart wrote:
> 
> 
> On 8/24/22 15:59, Greg Kroah-Hartman wrote:
> > When creating an attribute group, if it is named a subdirectory is
> > created and the sysfs files are placed into that subdirectory.  If no
> > files are created, normally the directory would still be present, but it
> > would be empty.  Clean this up by removing the directory if no files
> > were successfully created in the group at all.
> > 
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> > Cc: alsa-devel@alsa-project.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > v2: new patch
> > 
> > Note, totally untested!  The following soundwire patches will need this,
> > if a soundwire developer could test this out, it would be most
> > apreciated.
> 
> Not able to see the kernel boot with this first patch. The device is
> stuck with the cursor not even blinking. It seems our CI test devices
> are also stuck.
> 
> This is completely beyond my comfort zone but I can run more tests to
> root cause this.

Ick, ok, so much for sending out untested patches :(

I'll test and debug this tomorrow and resend a correct version, thanks
for helping out here, sorry it didn't work.

greg k-h
