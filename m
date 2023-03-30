Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C96736D085C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 16:30:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 223251EF;
	Thu, 30 Mar 2023 16:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 223251EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680186649;
	bh=wIvjUQI7ZY2zkX/cddd4Uw7YYmzZ3fwXp/8dEQj1MBY=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:From;
	b=UQrbV/8GLK+w6LvBhpSUkQ6I5nY2nC032+PARdBDDkn1+VoHLapyxeQG/LFA/dnVT
	 Q1tuiGAUOHsCRuBw1d4eatEx4zqlYICFpC7O0RTV+QnoCs9MyR/fa8y4L9VWyYNaQf
	 /JCka1yYS6IDYqYPFbqciwARX/G4l6aUvq4VZsrw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDDFCF8024E;
	Thu, 30 Mar 2023 16:29:54 +0200 (CEST)
Date: Thu, 30 Mar 2023 17:29:25 +0300
Subject: Re: [PATCH] ALSA: ac97: Define dummy functions for snd_ac97_suspend()
 and resume()
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20230330132847.12882-1-tiwai@suse.de>
In-Reply-To: <20230330132847.12882-1-tiwai@suse.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKEK7ZR65KKP2U75SQHYDR3WYZGQ2K6F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168018659339.26.12679433410350969665@mailman-core.alsa-project.org>
From: Tasos Sahanidis via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Tasos Sahanidis <tasos@tasossah.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD54BF80249; Thu, 30 Mar 2023 16:29:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from devnull.tasossah.com (devnull.tasossah.com
 [IPv6:2001:41d0:1:e60e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BC19F80249
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 16:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BC19F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com
 header.a=rsa-sha256 header.s=vps header.b=VNpwIuFM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GSkjQdd6Mmrcd4nsmrZ8Rt2FXmaJlWJyZn9ardTty2o=; b=VNpwIuFMIZzl0OEsCXKNPncHG7
	nXjHFAOJ5lkPTrlqGuiqOK52mQqq4iyF3hgztGyTr5yTRjlhbf/qgh7wSm66ouCC+SbEYZuPtJPOQ
	4fq1XYxFpgCFbaRcZVX+ELyau50uwMTVj8COle9KY72iN9HZklEmL0l1thXsZSZkqtxA=;
Received: from ppp-94-67-117-41.home.otenet.gr ([94.67.117.41]
 helo=[192.168.1.1])
	by devnull.tasossah.com with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <tasos@tasossah.com>)
	id 1phtHW-00H7kI-Hk; Thu, 30 Mar 2023 17:29:38 +0300
Message-ID: <d3892730-4098-5147-6055-dbde869b132f@tasossah.com>
Date: Thu, 30 Mar 2023 17:29:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ALSA: ac97: Define dummy functions for snd_ac97_suspend()
 and resume()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20230330132847.12882-1-tiwai@suse.de>
From: Tasos Sahanidis <tasos@tasossah.com>
In-Reply-To: <20230330132847.12882-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TKEK7ZR65KKP2U75SQHYDR3WYZGQ2K6F
X-Message-ID-Hash: TKEK7ZR65KKP2U75SQHYDR3WYZGQ2K6F
X-MailFrom: tasos@tasossah.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKEK7ZR65KKP2U75SQHYDR3WYZGQ2K6F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-03-30 16:28, Takashi Iwai wrote:
> For allowing the build without CONFIG_PM, add definitions of dummy
> functions for snd_ac97_suspend() and snd_ac97_resume() without
> CONFIG_PM, too.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Apologies for not catching this.

Reviewed-by: Tasos Sahanidis <tasos@tasossah.com>
