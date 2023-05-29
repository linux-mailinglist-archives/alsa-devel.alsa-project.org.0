Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEC271478D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 11:57:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A6CB1DD;
	Mon, 29 May 2023 11:57:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A6CB1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685354274;
	bh=rLHdho8xSHIg6jepucfODzYQ5NVHdqS21xSociSme+E=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=W5jVd5jccP+lvIyXa6R44IBhaoOIHTkU0WMpDrz+LajuLxgxfL8yFO0s5LuqSkXCO
	 FHSyccS4JRGmc5JzBrTqF7m33liiPHHgS0z4/n80wHL1CpBWzsq3PWebbRRMNrRKqo
	 ajWpngHIhzZxg8GJiQ4a/bnew09qxwjlA/EBp53s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 433CBF8055B; Mon, 29 May 2023 11:56:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 278ACF80549;
	Mon, 29 May 2023 11:56:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7B44F8026A; Mon, 29 May 2023 11:56:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D1ECF800DF
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 11:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D1ECF800DF
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id EA8D420076
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 05:56:14 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q3Zbq-LSC-00
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 11:56:14 +0200
Date: Mon, 29 May 2023 11:56:14 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/6] ALSA: emu10k1: improvements related to the driver's
 procfs
Message-ID: <ZHR2vmzoBjYasUGL@ugly>
References: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
Message-ID-Hash: RJ52YATYSPPDETECUP4RRUXUJPT6Z4B4
X-Message-ID-Hash: RJ52YATYSPPDETECUP4RRUXUJPT6Z4B4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJ52YATYSPPDETECUP4RRUXUJPT6Z4B4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 26, 2023 at 12:16:53PM +0200, Oswald Buddenhagen wrote:
>FIXME: the last commit is still being tested; something appears fishy.
>
ignore that; i forgot to amend the description.

>Oswald Buddenhagen (6):
>  ALSA: emu10k1: hide absent 2nd pointer-offset register set from /proc
>  ALSA: emu10k1: fix writing 1st pointer-offset register set through
>    /proc
>  ALSA: emu10k1: actually disassemble DSP instructions in /proc
>  ALSA: emu10k1: include FX send amounts in /proc output
>  ALSA: emu10k1: make E-MU FPGA register dump in /proc more useful
>  ALSA: emu10k1: vastly improve usefulness of info in /proc
>
