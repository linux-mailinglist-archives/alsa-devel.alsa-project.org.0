Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204DB7459F4
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 12:16:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F7F583A;
	Mon,  3 Jul 2023 12:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F7F583A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688379413;
	bh=x+Sa+ieW8DDdpQhKWyTg+uPF5mIAElgePb45jHysSzA=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qAj5jS0Xun4BgPt2v6//HGe7ldbTpHwDa1smBz1wXGEMhhWvT3bzmTmwwtV2+EBUI
	 qmY5jrgQ0wKXM8ZRfpIilCv+6M+RmXnKgX1g6is/wob1QJcPfJ+v9/ISq8TOWjbNg2
	 kWBdxb8UwDBCg8LJirgaDMRImBYwWicAHFgKvTUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D527F80104; Mon,  3 Jul 2023 12:16:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B529CF80124;
	Mon,  3 Jul 2023 12:16:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 556A3F80125; Mon,  3 Jul 2023 12:15:59 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 276B9F80104
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 12:15:59 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
From: "Symbolic Debugger" <happy.debugging@gmail.com>
To: alsa-devel@alsa-project.org
Date: Mon, 03 Jul 2023 10:15:59 -0000
Message-ID: 
 <168837935904.20.17592291383426699605@mailman-web.alsa-project.org>
In-Reply-To: 
 <168802789986.22.1719965101425313209@mailman-web.alsa-project.org>
References: <168802789986.22.1719965101425313209@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: AOTK7BE6JENHVJECZ4U4K2ZHKCTAFIYI
X-Message-ID-Hash: AOTK7BE6JENHVJECZ4U4K2ZHKCTAFIYI
X-MailFrom: happy.debugging@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QWN52FKVEZ4WMMOLS3VCQ7IQX24KXT4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I wish to program (C) against the new ALSA drivers. Understandably the current alsa-lib one is for the current kernel (up to 6.4) but since I have the kernel installed, I don't have the .h and .so files and distro's may  include the packages  (libasound) even later. Is there a interim library available before the kernel and distro's are updated ?
