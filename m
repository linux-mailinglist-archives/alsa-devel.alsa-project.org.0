Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9B557553
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 02:17:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFAC01695;
	Thu, 27 Jun 2019 02:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFAC01695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561594647;
	bh=KOI4MUCroo79cNJF2rKDTUQW0Pv7HkUScg+8ohIR5Og=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mYSnjYeUzMkwyDGQMeGMibLkbbhjzUhQ7qSh8EK+cN+VqYXAPataaMlYe+Fni+ZjQ
	 WlAwMXcR/3XzbjF2tqabx2qcmQbn7CkNUxpqgJ8agrsiXk8WODcJYXxAb6HP7Q7RFa
	 IvmfyAGYRdU/dNoTZ9STVpbHMAXjclJYBMMP9I4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28C5DF896CC;
	Thu, 27 Jun 2019 02:15:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C21DF896B9; Thu, 27 Jun 2019 02:15:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C90B5F806F0
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 02:15:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C90B5F806F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="w1UNaNgd"
Received: from localhost (unknown [116.247.127.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 140D8216C8;
 Thu, 27 Jun 2019 00:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561594533;
 bh=MJ2KaTKdJNeLe5zaJz4d4Ny22PpPk93/u2IsVDP5gTg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=w1UNaNgdiGcLVSa46TY2rC43A/omDRFx/nI+uYIIUguEafGhYmsxnoYlOhWYmzNTw
 8QjTpP9GEDj0wrsc3RVvl9OutcwldNGi7gSIUqt0ESbxEucM6L1uwSlX+E6kWt6jiw
 BMjDWG3Z04aCiGPD2o7K/9adsHthTjAwyDYtXzE8=
Date: Thu, 27 Jun 2019 08:15:30 +0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Message-ID: <20190627001530.GG527@kroah.com>
References: <20190626153611.10170-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626153611.10170-1-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, rafael@kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, linux-acpi@vger.kernel.org,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 1/2] device property: Add new array helper
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

On Wed, Jun 26, 2019 at 04:36:10PM +0100, Charles Keepax wrote:
> It is fairly common to want to read an integer array property
> that is composed of an unknown number of fixed size integer
> groups. For example, say each group consists of three values
> which correspond to the settings for one input on the device
> and the driver supports several chips with different numbers
> of inputs.
> 
> Add a new helper function to provide this functionality, it
> differs for the existing helpers in that it allows reading a
> smaller number of values than the full array size and checks
> that the number of values read is a multiple of the group size.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/base/property.c  | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/property.h |  2 ++
>  2 files changed, 50 insertions(+)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
