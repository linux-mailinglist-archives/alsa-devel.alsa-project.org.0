Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B27F8591F54
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 11:46:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C555827;
	Sun, 14 Aug 2022 11:45:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C555827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660470383;
	bh=FQPHImPu4yjh6ADH+9enzeF6KN+zI2MmD20GsS9hhOw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HjiZloemI9Zla0adP0d4OwYUqCCL4SaogoGi6JxUtgM8YVZrHgfcNHWefcbDy5dQE
	 XlXeb4G6laxMiBDipuSoYGakVeR+rNqY5GmVHp/LR0oGvTE3wNvk9kRmMqiKvASsjp
	 tQjKfoqVpR7rUeYkRlL10p3E08bQ1rw0jQQAPweQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D25CF80095;
	Sun, 14 Aug 2022 11:45:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09F43F804BD; Sun, 14 Aug 2022 11:45:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E420F800CB
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 11:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E420F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com
 header.b="qAarWNTR"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="WEq9wKKY"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id A524B2B05FDE;
 Sun, 14 Aug 2022 05:45:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 14 Aug 2022 05:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1660470310; x=1660477510; bh=FdFP/H49+r
 ZQsPEMoSpH1blp96NX4j7NVyCsnlQOwKc=; b=qAarWNTRnx4c01YwaTDmDon3cT
 WoeRczFOoEi+9Yn59fFevm4BDrerzL8Qlujy0xfLMkyaoQfIjNfen2HFSFBZFB0Q
 XNoGICGJC2sUobGRe86muQFZE/cYsqOO0j6IYwB2CS835Qsq6BPjKB+oDCW1JO6C
 pvpC0Mrw3QJMLQBeUlYwEfqvZK9YB3kuH9EMynjrZLBo/InM0t4Q81pjJHfQ/p5C
 0GtZsBGQ50dS2bXKJjx8WZiCTf9hqEWVJ5wm05nZnJc0C5bBQAUdT1VxX2j9oC6q
 rMDXsGcuxb3sCu+JA4QRd5t25AOxNytA3uK+r1ikFU+3ya5x2lNxSQ3uOUHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660470310; x=1660477510; bh=FdFP/H49+rZQsPEMoSpH1blp96NX
 4j7NVyCsnlQOwKc=; b=WEq9wKKYIAAfYldO75VsevXwtHARcaxZHLAmNnNZOXvl
 wHUSsxEtGpaNN3dcgybyp8V9bC3iR+WQnHsnaCSZtbGUn7WqOOE+y88ew9CrEtx5
 KccnnLpEFgx2sZNnrD+2QgNax+OUTUxes3cue/UpBUigm0LVysdKx6b2edhOsgZT
 mtz4CGcucgfqJpkzKvq1kD0ja/cYYzlwZt12b6/okBLPFIy7Zoi8WEKLybxgSkEn
 qIF4eT4qV55GGWIEmLBKV3yahBmceZa5NbIFCtOF0zUHfm5JHWY+3COP2i5veLeX
 /JfYijRGOvc4xZPuEv0vc7RWsguBIkKbVSYcmDGkGA==
X-ME-Sender: <xms:JcT4YkO7Ly_4uqAXJmmRm0-QB8iX31G2BqbeQjSuNhwGRG7tSzNZTw>
 <xme:JcT4Yq8JS_2dJZE1m116k-XLejcBKE8CXlzlbLLVZbPd_kPksKcQqN9PjZ4R4de9I
 JgZiTHVVbXg7w>
X-ME-Received: <xmr:JcT4YrSxWurW3qk0bXoJ6qJhvidpvl77Ew5BY3W3fUuP4WgcOp0HUBSzgKCOyGLpztk9TwoIAtvdkYDS2XLufxfhCqR6R8Xs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehtddgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
 evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:JcT4YsvNGHOewyt4liefkpERA5-M7Vq3i8D1AjJpE7vjFGZ3CcbNKw>
 <xmx:JcT4YsfF20dlijfbWGKDEFXK07WPoktI5RKo7qnDlHFX-qpPjZjqWQ>
 <xmx:JcT4Yg2cnnLquv9NJZJLdzEdV03CcEz03nJMpGhaVZuubGmvSlm6-g>
 <xmx:JsT4YrrN8xxMcyzbPO3A2899hU6_IbdITtL48JdhfnZS1NRAblIm1CKmmu4>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Aug 2022 05:45:09 -0400 (EDT)
Date: Sun, 14 Aug 2022 11:45:06 +0200
From: Greg KH <greg@kroah.com>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
Message-ID: <YvjEIjXg7KxtTT/0@kroah.com>
References: <20220814080416.7531-1-khalid.masum.92@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220814080416.7531-1-khalid.masum.92@gmail.com>
Cc: alsa-devel@alsa-project.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, Len Brown <lenb@kernel.org>
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

On Sun, Aug 14, 2022 at 02:04:15PM +0600, Khalid Masum wrote:
> According to the TODO, In sw_bus_master_add, bus->multi_link is to be
> populated with properties from FW node props. Make this happen by 
> creating a new fwnode_handle flag FWNODE_FLAG_MULTI_LINKED and use 
> the flag to store the multi_link value from intel_link_startup. Use 
> this flag to initialize bus->multi_link.
> 
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> ---
> I do not think adding a new flag for fwnode_handle is a good idea.
> So, what would be the best way to initialize bus->multilink with 
> fwnode props?
> 
>   -- Khalid Masum
> 
>  drivers/soundwire/bus.c   | 4 ++--
>  drivers/soundwire/intel.c | 1 +
>  include/linux/fwnode.h    | 1 +
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index a2bfb0434a67..80df1672c60b 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -74,9 +74,9 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
>  
>  	/*
>  	 * Initialize multi_link flag
> -	 * TODO: populate this flag by reading property from FW node
>  	 */
> -	bus->multi_link = false;
> +	bus->multi_link = (fwnode->flags & FWNODE_FLAG_MULTI_LINKED)
> +		== FWNODE_FLAG_MULTI_LINKED;
>  	if (bus->ops->read_prop) {
>  		ret = bus->ops->read_prop(bus);
>  		if (ret < 0) {
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 505c5ef061e3..034d1c523ddf 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1347,6 +1347,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
>  		 */
>  		bus->multi_link = true;
>  		bus->hw_sync_min_links = 1;
> +		dev->fwnode->flags |= FWNODE_FLAG_MULTI_LINKED;
>  	}
>  
>  	/* Initialize shim, controller */
> diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
> index 9a81c4410b9f..446a52744953 100644
> --- a/include/linux/fwnode.h
> +++ b/include/linux/fwnode.h
> @@ -32,6 +32,7 @@ struct device;
>  #define FWNODE_FLAG_NOT_DEVICE			BIT(1)
>  #define FWNODE_FLAG_INITIALIZED			BIT(2)
>  #define FWNODE_FLAG_NEEDS_CHILD_BOUND_ON_ADD	BIT(3)
> +#define FWNODE_FLAG_MULTI_LINKED		BIT(4)

What does this commit actually change?

Did you test this on real hardware?

thanks,

greg k-h
