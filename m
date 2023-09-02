Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14159790548
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Sep 2023 07:35:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C813741;
	Sat,  2 Sep 2023 07:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C813741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693632942;
	bh=0+s1agQk+6o6/Dc3ZVIlEUZ0Ukre+kXt0cKtoss99ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eIxn3lVkgVMkdLYn6Oo9+6YuiOvSJIEYOJA9gMmlePXQIt7vdina5ALnVg3sr2e9s
	 +82j2F4ojhvjFtjJXisa2MLDihHUR0RaA1E07j9FO+TBk+xJgFnGEeAFRXzUgo7nMR
	 tg4ow4KQDdbUB17lMJ/uTJ8sekz+QtV1+5i6Z980=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A78A8F804DA; Sat,  2 Sep 2023 07:34:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41814F800F5;
	Sat,  2 Sep 2023 07:34:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 437EAF8032D; Sat,  2 Sep 2023 07:30:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk
 [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 489E5F800F5
	for <alsa-devel@alsa-project.org>; Sat,  2 Sep 2023 07:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 489E5F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256
 header.s=zeniv-20220401 header.b=Y/TZXjeo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zpcuNBemwKhdVlTEYSSLaiBYpszJPZ71l/vhtjkuOsY=; b=Y/TZXjeo9OOsz2fA28zF9l/zjc
	AjThsX49wUSDSItKey1jotxIa24L9czAhjBfEIWsWb2rB+qHOA0npm+WnastiuhhWLpidXAzMzt9v
	ez9xZuFRQmN1ZGA7GMJ0yscE/9CMlOwAksmnbvZUDVeW6RQhjZBYNajgZmle2HjXAGIkbLrR9soXZ
	7YU6Yf5SCZbiezXg2E2v1Cq3fliH1Ez4fefQB/SeuXLWIVbTBQlDnJtfiBZl75M5nFkSz+Wp9gRVN
	OTo8itdX6uSPnKHPi+qzyE1y0f8SHaxGQUFD+BGe7f/r116Vaq8eXQ2tOZB6ZjMgy77ZKULBHOBSZ
	J/W6TS7Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux))
	id 1qcJDY-002kuw-1c;
	Sat, 02 Sep 2023 05:30:44 +0000
Date: Sat, 2 Sep 2023 06:30:44 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/25] ALSA: pcm: Add copy ops with iov_iter
Message-ID: <20230902053044.GJ3390869@ZenIV>
References: <20230815190136.8987-1-tiwai@suse.de>
 <20230815190136.8987-3-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815190136.8987-3-tiwai@suse.de>
Sender: Al Viro <viro@ftp.linux.org.uk>
Message-ID-Hash: 7DQNOUYBCDLUYY4CIP6GBTNKL4V3ZGM3
X-Message-ID-Hash: 7DQNOUYBCDLUYY4CIP6GBTNKL4V3ZGM3
X-MailFrom: viro@ftp.linux.org.uk
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DQNOUYBCDLUYY4CIP6GBTNKL4V3ZGM3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 15, 2023 at 09:01:13PM +0200, Takashi Iwai wrote:

> -	if (copy_from_user(get_dma_ptr(substream->runtime, channel, hwoff),
> -			   (void __user *)buf, bytes))
> +	if (!copy_from_iter(get_dma_ptr(substream->runtime, channel, hwoff),
> +			    bytes, iter))

The former is "if not everything got copied", the latter - "if nothing got
copied"; the same goes for other places like that.
