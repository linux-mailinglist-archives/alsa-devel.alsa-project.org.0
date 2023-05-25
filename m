Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C994471091C
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 11:41:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEE76D8;
	Thu, 25 May 2023 11:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEE76D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685007676;
	bh=tk07/ewbEXAQwN9HBSayfaE5VfSjokKKYgxexbd59oU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qes7cmi2bZ5B2fzc7y9IC5hsPJ0+IuKZjfFjPv6my1IdUN/6fE4cI5uW8/0I77O3W
	 Dny1EdH9q98X4O9L0PjiOuuE/LysDEP5gmqZVKpkNcFiWlsv8wzjKD7Bkmn4/ETIV2
	 ryOXoajXRX6nX0KwowZ9a56KTPceARiWaVGHFoYA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A98C2F80425; Thu, 25 May 2023 11:40:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 753DBF8016A;
	Thu, 25 May 2023 11:40:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E981DF80249; Thu, 25 May 2023 11:40:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 65830F80053
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 11:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65830F80053
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1685007621373788118-webhooks-bot@alsa-project.org>
References: <1685007621373788118-webhooks-bot@alsa-project.org>
Subject: Linux Mint 21 MSI Z790-A WIFI (ALC4080) no audio from spdif
Message-Id: <20230525094022.E981DF80249@alsa1.perex.cz>
Date: Thu, 25 May 2023 11:40:22 +0200 (CEST)
Message-ID-Hash: X7JDUM652XTMMY5N4PCYSAOECSVAYC4N
X-Message-ID-Hash: X7JDUM652XTMMY5N4PCYSAOECSVAYC4N
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7JDUM652XTMMY5N4PCYSAOECSVAYC4N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #318 was edited from jasonzliang:

Hi,

I been troubleshooting problems with sound not coming out from my optical port and I narrowed it down to Linux having problems with the ALC4080 chipset on my MSI Z790-A WIFI motherboard (id: 0db0:d1d7). The version of alsa-ucm-conf installed on my system is 1.2.6.3-1ubuntu1.5. 

My question is, what changes do I need to make to the alsa configuration files in order to get audio working again?

Thanks

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/318
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
