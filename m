Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2B21939A3
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 08:29:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F2D6165D;
	Thu, 26 Mar 2020 08:28:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F2D6165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585207778;
	bh=Q3K+7pxeUdLdRNAiY1ArOBt8EhEIkSVNiy6pFl3MHMA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t5KdsVmmDY5c/pSDgKUQOOJ2E7WsChiDMMUoyDsNHDqMit3JiQ8kX2mb92AznpHGq
	 sF0mpGm2I6kqrEy4YvqXKGo4fZCouM/Ce9UZ+76GcCbl2HkGShGSlLWKcsUVHrbMuA
	 dA5xi36jfQCOyvUZyq+oG99x6uL62QwAg4v309g8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38E27F801F9;
	Thu, 26 Mar 2020 08:27:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 156D5F80227; Thu, 26 Mar 2020 08:27:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4412F80095
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 08:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4412F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YHNdD+Z9"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE8E220714;
 Thu, 26 Mar 2020 07:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585207667;
 bh=Q3K+7pxeUdLdRNAiY1ArOBt8EhEIkSVNiy6pFl3MHMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YHNdD+Z9KSFLHDZrpvvIwuevj7UkWHg7PeZZs5JDEvCaw73uZbOhJAob/zOFv7liA
 zvy965JiPRcdjAkgDWxq/kF1MGHPqbV7HHFGklHnwpS4xUIdTa9vBTdABOcOMyG8JL
 koIM4cPdCEa1PdQgQsbleLyJzwZE09QRX4UxOjm4=
Date: Thu, 26 Mar 2020 08:27:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v1] slimbus: core: Set fwnode for a device when setting
 of_node
Message-ID: <20200326072745.GA935394@kroah.com>
References: <20200326061648.78914-1-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326061648.78914-1-saravanak@google.com>
Cc: John Stultz <john.stultz@linaro.org>, alsa-devel@alsa-project.org,
 kernel-team@android.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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

On Wed, Mar 25, 2020 at 11:16:48PM -0700, Saravana Kannan wrote:
> When setting the of_node for a newly created device, also set the
> fwnode. This allows fw_devlink to work for slimbus devices.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Change-Id: I5505213f8ecca908860a1ad6bbc275ec0f78e4a6

-ENOCHANGEID :(

