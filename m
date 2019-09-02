Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9DAA5B08
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 18:02:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77B7D16F3;
	Mon,  2 Sep 2019 18:01:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77B7D16F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567440152;
	bh=CAZHsh6Nt23UyBOFqwWnLNUiZXr6nQ5hZEjV7N27ZoU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rOxu9USBfUpTBU8mU3H/L+US82f0mYqEVB3X8qojXrF8fidQ/6idTwV6qjnEGZMbv
	 rmAWMn1WlhAinea/9nt1JVHkDlFOvNSnqadcYSMq4LTFiW8xO0aOwkneZIV9hqz9Yz
	 qzbI/hDvDgWXaHyThSw5LuVYGZPIgLIMMNYnXVDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 171EFF80447;
	Mon,  2 Sep 2019 18:00:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E609CF803D0; Mon,  2 Sep 2019 18:00:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26A69F802E0
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 18:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26A69F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jyJIVH01"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2501A217D7;
 Mon,  2 Sep 2019 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567440034;
 bh=5U5wL+Lav8vc8FrVzZiXNl6k4DkKZxyIr97Ik1CVkR8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jyJIVH01rQHFkDbbkIGWWmoKXDHWvpyOA/lurrWX3CEEpDxAYQ+25OiP9Bd13EuV3
 ySI41/OeMWlserWFVwt4v9Un20NTwO4ieCbyezUzlhtia2P8ElcvcFkeakTEneJBdL
 ydYYQwVlG6/va9PNykJOK34/r78OQLEW52F/z1jA=
Date: Mon, 2 Sep 2019 18:00:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hui Peng <benquike@gmail.com>
Message-ID: <20190902160029.GB21884@kroah.com>
References: <20190830214649.27761-1-benquike@gmail.com>
 <CAKpmkkVQ2fbL47JrbVMrfCenPShjjwfkS9MY0Ay5MpyFjftxpg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKpmkkVQ2fbL47JrbVMrfCenPShjjwfkS9MY0Ay5MpyFjftxpg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Wenwen Wang <wang6495@umn.edu>, Mathias Payer <mathias.payer@nebelwelt.net>,
 stable@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH 1/2] Fix an OOB bug in
	parse_audio_mixer_unit
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

On Fri, Aug 30, 2019 at 05:49:59PM -0400, Hui Peng wrote:
> This is the backported patch of the following bug to v4.4.x and v4.14.x:
> daac07156b33 ("ALSA: usb-audio: Fix an OOB bug in parse_audio_mixer_unit")

Thanks, also now queued up to 4.9.y, you forgot that one :)

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
