Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2656F7E42
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 09:57:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61DC52BD9;
	Fri,  5 May 2023 09:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61DC52BD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683273470;
	bh=8SQyxkPPqcTVY2M5E3fzPIaTvy6ECCVbqBglchMHuRI=;
	h=Date:Subject:References:To:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=SNGRyfv53nIUGjPXV0T3JRx4GlAiUHNB6kl5IzjVYHnaynGSU8kcTmxins71s1y4S
	 gegg5YZCXtepzRaxPh2eOzZRbqqYLaiuDrTn0ZICO2KoPhYcSF22m0hSNHHQdWJRCD
	 IejpescQLhFeWkDswFxRLxeSRl+BvknIC79jaI0I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FC10F80529;
	Fri,  5 May 2023 09:56:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ADE8F8052D; Fri,  5 May 2023 09:56:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A67B9F80087
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 09:56:52 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9A95C11E2
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 09:56:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9A95C11E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683273411; bh=xnVSKcaU6FwCUxV0gpWXuLqckMnKrhlqtHjzN8fn4fI=;
	h=Date:Subject:References:To:From:In-Reply-To:From;
	b=Zh0/NI2PT2nPn9dsK+6AW4xYvI2KTQWLZBWcKEv1tJLqXFbZ0Pzm6spWSfda+QYZC
	 Zv9Secdtzz4sjbCxjAf9Ises75B5JtkDk5joMO2wcncPMrxLPyRnnPaDPe0EdF77vV
	 skW+9aEepCyAdgJsYtKpFAmgCnonvi9u4dz/pOBs=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 09:56:50 +0200 (CEST)
Message-ID: <b1971278-d469-3d34-ac9e-ada01e9b734e@perex.cz>
Date: Fri, 5 May 2023 09:56:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: ALSA 1.2.9 release
Content-Language: en-US
References: <042e2b9f-6e1c-b821-0b30-d317ea771172@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <042e2b9f-6e1c-b821-0b30-d317ea771172@perex.cz>
X-Forwarded-Message-Id: <042e2b9f-6e1c-b821-0b30-d317ea771172@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EJH2E6BAN7QC27MKYNK2ULOXH4YLTH55
X-Message-ID-Hash: EJH2E6BAN7QC27MKYNK2ULOXH4YLTH55
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EJH2E6BAN7QC27MKYNK2ULOXH4YLTH55/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello all,

	new ALSA userspace packages were released. You may download them from
the ALSA website http://www.alsa-project.org or directly:

	HTTP: https://www.alsa-project.org/files/pub
	FTP:  ftp://ftp.alsa-project.org/pub

Released packages:

	alsa-lib
	alsa-utils
	alsa-ucm-conf

Full list of changes:

	https://www.alsa-project.org/wiki/Changes_v1.2.8_v1.2.9

The fingerprint of the public signing key is:

	F04D F507 37AC 1A88 4C4B 3D71 8380 596D A6E5 9C91

				Have fun,
					Jaroslav
-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
