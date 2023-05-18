Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC0070835E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 15:59:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F6951F9;
	Thu, 18 May 2023 15:59:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F6951F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684418391;
	bh=kMIEJWGK5qDMqAB6VXsC7mtm3k5yTUmyxHlS0FRCZaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dkBaJgzpAYwifx0iZ/cEAO3AY1454EVTLeMtqai7Sz6A+eDx2ZJ3gybC5BxqtbYsV
	 bLzD2U7JM8JPGk4d+88aRRTdMNX0ebPSyLf2XblFyPiyrn0v82zNycLLtudBpT65GM
	 T7drtuEdl1w/YMk2HkwV2VaWDlek8zpeSvlqVK0A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BE22F80431; Thu, 18 May 2023 15:59:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 536A9F8025A;
	Thu, 18 May 2023 15:59:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 361E6F80272; Thu, 18 May 2023 15:58:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0DCDF8016D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 15:58:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0DCDF8016D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 7CE4523E25;
	Thu, 18 May 2023 09:58:51 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pze9b-cDb-00; Thu, 18 May 2023 15:58:51 +0200
Date: Thu, 18 May 2023 15:58:51 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Tom Rix <trix@redhat.com>
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: emu10k1: set variables emu1010_routing_info and
 emu1010_pads_info storage-class-specifier to static
Message-ID: <ZGYvG2Sf9ZeeOmL6@ugly>
Mail-Followup-To: Tom Rix <trix@redhat.com>, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230518123826.925752-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230518123826.925752-1-trix@redhat.com>
Message-ID-Hash: PZPLLEN4ZYHLH3RAQZ2SD2B5APCCPKXA
X-Message-ID-Hash: PZPLLEN4ZYHLH3RAQZ2SD2B5APCCPKXA
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZPLLEN4ZYHLH3RAQZ2SD2B5APCCPKXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 18, 2023 at 08:38:26AM -0400, Tom Rix wrote:
>smatch reports
  ^^^^^^ is this the best word to use here?

>sound/pci/emu10k1/emumixer.c:519:39: warning: symbol
>  'emu1010_routing_info' was not declared. Should it be static?
>sound/pci/emu10k1/emumixer.c:859:36: warning: symbol
>  'emu1010_pads_info' was not declared. Should it be static?
>
>These variables are only used in their defining file, so it should be static
							  ^^ they
>
>Signed-off-by: Tom Rix <trix@redhat.com>
>
Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

(also amending one of the still pending patches. thanks!)

regards
