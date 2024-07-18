Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BB1934793
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2024 07:22:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE5F8E69;
	Thu, 18 Jul 2024 07:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE5F8E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721280175;
	bh=NgmeiPPDAyPopcLCc9azx/v1NO4VA13+t8G17dW8cdI=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=i3EWcFlY2UR9Eiv5dWTdPIj8Yr2Z56t4GBOy3vY/Igm7wER4qzIjeiiiy8EkDdGPv
	 jasSZY/FO825A+5KaVNZKBmByfvQMA1PB3/wf42X9bZ9vn0kLYseXvWmHeHQmU2G2h
	 rIBRiv/jD3cVoiEtSQvZVjX9IuVNukI0nmxMhqpQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67F5DF805BD; Thu, 18 Jul 2024 07:22:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A03AF805AF;
	Thu, 18 Jul 2024 07:22:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 940AEF8026D; Thu, 18 Jul 2024 07:22:19 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 734D4F8007E
	for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2024 07:22:19 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: Inconsistent order of channels on C-Media 7.1 channel device
From: victor@allumeenergy.com.au
To: alsa-devel@alsa-project.org
Date: Thu, 18 Jul 2024 05:22:19 -0000
Message-ID: 
 <172128013945.5354.17755222505890150530@mailman-web.alsa-project.org>
In-Reply-To: 
 <172127835604.6185.4671370925729472425@mailman-web.alsa-project.org>
References: 
 <172127835604.6185.4671370925729472425@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: DFRPMLAWTBDSRQ2VPVQHRF7WN4UXCZFF
X-Message-ID-Hash: DFRPMLAWTBDSRQ2VPVQHRF7WN4UXCZFF
X-MailFrom: victor@allumeenergy.com.au
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IXQYZJAEA3V372PYU46TEAHCV54EJPOC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

(sorry, I didn't realise that github issues went to the mailing list as well)
