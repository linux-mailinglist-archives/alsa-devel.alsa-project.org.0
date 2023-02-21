Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCA869E204
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 15:10:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7D67E7E;
	Tue, 21 Feb 2023 15:09:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7D67E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676988610;
	bh=TBfEWvTmaI9MMkJWTcNkNAcdUNzLmSGgfxmLCElNLUU=;
	h=Date:From:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QDnY9QCsb4v+IFNDfpD058T7kWSfDfIVsnJ+uC5jmFFpJ9mHxksp3lBDFWkmF7l8u
	 lTAEIykY2P5DgSXwFk8cfbh3B4R419yfYig6vCJau0eK7U6p6Nca5lJGK/9e5NzESS
	 Oecxk/U0tLWtHP4nXnLOuSnZJ08+bg6QpCu+QRYc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D347F8025A;
	Tue, 21 Feb 2023 15:09:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E19C5F80266; Tue, 21 Feb 2023 15:09:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89C3AF80125
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 15:09:12 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D504911C4
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 15:09:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D504911C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1676988551; bh=T8IbIRPb09Y0T7Kc2kqGyjJZZZS2KEEUdE8tTQQ+T8A=;
	h=Date:From:Subject:To:From;
	b=NZj1C/55ijY7zSoeFSzrSrDmaONV7ST2mCfK6xhScmoPdrWotGhREmieaNFyFzy71
	 1CArH+j3uSwHGBxV/17UfmzyEvMBHgMarw3Ke4GyrfVI7W2U0bkPv9vnx9wqxDf4e0
	 G7OTeUPOKO6iY9tHKOzjj56SlRli5nrLjPGCLPOc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 15:09:10 +0100 (CET)
Message-ID: <5b20f4b8-d5d9-0694-192b-5841467c0601@perex.cz>
Date: Tue, 21 Feb 2023 15:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
Subject: alsa-devel mailing list - mailman upgrade
To: ALSA development <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DN6B3X7LRQJGIVFIN6WEQQVOXLQAE3OW
X-Message-ID-Hash: DN6B3X7LRQJGIVFIN6WEQQVOXLQAE3OW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DN6B3X7LRQJGIVFIN6WEQQVOXLQAE3OW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all,

	I upgraded the mailman 2 to mailman 3 on the ALSA server. I hope that you do 
not see any differences, but there is a major change in the handling of the 
user logins to maintain your subscription using the web interface [1]. It 
means that you should create a new user account on the mailman server [2].

	Do not request the password change for the first login. Although the 
subscriptions are migrated, the new system will send you a reply that your 
e-mail is not in the user database. Although it is technically correct, it is 
very confusing. Create a new account using identical e-mail as you are 
subscribed. Your subscription will be assigned to this account according your 
e-mail. You will be allowed to maintain all list subscriptions on the server 
then (not only one list subscription like before).

Archive URLs are different, but I will keep the old archive (URLs), too.

Enjoy new Postorius and HyperKitty frontends.

If you have any issue, please, let me know.

				Thanks,
					Jaroslav

[1] https://docs.mailman3.org/en/latest/faq-migration.html
[2] https://mailman.alsa-project.org

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
