Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF35D6F8EF4
	for <lists+alsa-devel@lfdr.de>; Sat,  6 May 2023 07:58:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5BF22ABF;
	Sat,  6 May 2023 07:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5BF22ABF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683352683;
	bh=7DdsHsw2NZCQ2RLOCk1YMqHyDASox3loQHQGzUwb2Rw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fFPp03Lvu2LiYru/I4VCCFWZeTTuxerQx6PJJ3uzAnY6vktiTA0OzexqIVEQQw8Q2
	 8bqQc07RVNbFV+maPTZ7mNRaZqa09ljWZk5V54hnwwW3ejrqKqicaUZqcRBztQcOk6
	 QgoQ8r4x7fod1GAwlEFF/4YzvX0VApySfM2XC8Rg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59BB2F80529;
	Sat,  6 May 2023 07:57:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A71DFF8052D; Sat,  6 May 2023 07:56:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D470F80520
	for <alsa-devel@alsa-project.org>; Sat,  6 May 2023 07:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D470F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm3 header.b=tVyeQUA+;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=fCk8zsDa
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 74B7B5C0088;
	Sat,  6 May 2023 01:56:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 06 May 2023 01:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683352570; x=1683438970; bh=EG
	S5hZyAL9I43PGeKYKJIudiB349boLUw0HVlFIo3AQ=; b=tVyeQUA+MP9z3eOiSJ
	CbCDeX/CmDAJLaBykdXzTvPnjxnVzH3lYWd0uTPKAs0HVu6gIVlgjRrpty5ypJWb
	lzV2PCwX5egBJM/2X4qSNnF8l3oM/tzbisuZ/h+OqjI/FUEQtpvfRUH/3FJ/GhgO
	rbcq3y5VDdKWBjtyWEWRYBRZnQrEXS+z/2BOfp+CusjSwSoTtKfoZnWO4Mio/Shw
	p5R38mgA0AgfPvFLVxdRc45n2zfV4Xwphc2yVhX7jAtjdIIXRf10vWxsX1gl0VcH
	oImHFNOjEfOLvQuIKZwT+UEycWU6TWQL9mnZPsBr8K/msgBfofCbJezUSXTygL3k
	j0DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683352570; x=1683438970; bh=EGS5hZyAL9I43
	PGeKYKJIudiB349boLUw0HVlFIo3AQ=; b=fCk8zsDaqA/oZLRtVBG1pcijz8cOw
	LfZRwDUUBra1euNIhrb9FtiH9eF3c7+GqVB/6cYH650FWmnbNdWrkVnkVOO9UxQy
	/Pb/qs8XSIOYr2wnhkEd0d5NuvBqflUdkGE4n/2J1ohjI/LVTAulHfWuVkxWVrqR
	M/wY6x6CoMS1sXEHfCnfJW6MvN2SPIFaNocXjVMngCi3MlgG9/VXtBL7701TSJnK
	HazjBVDqF+UQ2GQrHo/bDhniCdP865TZSa8F4tQ5ib99COw8TpL0J76yIyE4CDIY
	LsD9irx4/0C5NYDoFNJpOmYEvLdRUi0P5VfQXeGIg0pMQRjLqPHQ5DDkw==
X-ME-Sender: <xms:-utVZLYpKk0c1uXdWbPclUY4ZcemhsLirLwvP632Fp3F_yM-MZCEjw>
    <xme:-utVZKZiK0zPoz3JxEaJhMhjetrpyZNe3UehfFB1fFLpGD8aq6XebR8q9oi3V6Ma3
    ob6WSwB8RROSw>
X-ME-Received: 
 <xmr:-utVZN98gkUJSJp5i3_Wt2-PwsqH7CnHzgn99SYP4uF57JmUa5_yU43zOfNCtQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeeffedguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeeghe
    euhefgtdeluddtleekfeegjeetgeeikeehfeduieffvddufeefleevtddtvdenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:-utVZBrxNpm4DBNCWgzB0Ih2ZiKPqW70OhYgLrELqKpLM287VdC3Gg>
    <xmx:-utVZGrIPaVi09bP7UmAtrfFcsuqvkS_0KhMf7LAhJFB2qQvhUDkug>
    <xmx:-utVZHQt_AuizuH-P38OjyNpRd7epwVW5RabTNd_0oj6NbJCBOx9Eg>
    <xmx:-utVZPZW9PJNqmvsvZb-hYYmwBIuI6IRh8XfORQJsrd7abfimEtCyQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 May 2023 01:56:08 -0400 (EDT)
Date: Sat, 6 May 2023 11:09:57 +0900
From: Greg KH <greg@kroah.com>
To: yixuanjiang <yixuanjiang@google.com>
Subject: Re: [PATCH] ASoC: soc-pcm: Fix and cleanup DPCM locking
Message-ID: <2023050644-dwarf-shabby-d44d@gregkh>
References: <20230504092142.4190069-1-yixuanjiang@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504092142.4190069-1-yixuanjiang@google.com>
Message-ID-Hash: CFQ6BHKGHM5PG7KDYDI5CFID3V3MAPPU
X-Message-ID-Hash: CFQ6BHKGHM5PG7KDYDI5CFID3V3MAPPU
X-MailFrom: greg@kroah.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CFQ6BHKGHM5PG7KDYDI5CFID3V3MAPPU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 04, 2023 at 05:21:42PM +0800, yixuanjiang wrote:
> From: Takashi Iwai <tiwai@suse.de>
> 
> The existing locking for DPCM has several issues
> a) a confusing mix of card->mutex and card->pcm_mutex.
> b) a dpcm_lock spinlock added inconsistently and on paths that could
> be recursively taken. The use of irqsave/irqrestore was also overkill.
> 
> The suggested model is:
> 
> 1) The pcm_mutex is the top-most protection of BE links in the FE. The
> pcm_mutex is applied always on either the top PCM callbacks or the
> external call from DAPM, not taken in the internal functions.
> 
> 2) the FE stream lock is taken in higher levels before invoking
> dpcm_be_dai_trigger()
> 
> 3) when adding and deleting a BE, both the pcm_mutex and FE stream
> lock are taken.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> [clarification of commit message by plbossart]
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Link: https://lore.kernel.org/r/20211207173745.15850-4-pierre-louis.bossart@linux.intel.com
> Cc: stable@vger.kernel.org # 5.15.x
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

What is the git commit id of this patch in Linus's tree?

thanks,

greg k-h
