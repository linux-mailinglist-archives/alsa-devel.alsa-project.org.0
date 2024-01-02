Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38062823E81
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 10:23:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAD6BEB6;
	Thu,  4 Jan 2024 10:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAD6BEB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704360204;
	bh=/Rrxph1FzSqtfo+CMowfYdZ9PlPcKe0NVAgo5z4EwtU=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lRZp2X6U8ULfTuETaV7c6xNvYEf8ZM24lGDKmSyZAkE5+evM5Se2rf9I5JPzS6mP6
	 DV5/MvwVQE33bXNI9JvtlSYSoHoADJcdM8rP8w22mT/ekn5WPoVfLenbu1M0yxLqep
	 ajOwXYVJE2NmZnteSznxFOmJyCW3pKSp04JOtyiM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1377AF805C5; Thu,  4 Jan 2024 10:22:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D736F805A8;
	Thu,  4 Jan 2024 10:22:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D03B9F80224; Tue,  2 Jan 2024 23:38:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-200167.simplelogin.co (mail-200167.simplelogin.co
 [176.119.200.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FAA9F80074
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 23:38:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FAA9F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=willian.wang header.i=@willian.wang header.a=rsa-sha256
 header.s=dkim header.b=QcUHuszj
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1704235120;
	cv=none;
 b=STSyzQ0RkZ4JgWQlHgMI3IlxqvZHq+64SfjGh1Cjg02hNEELl9fDvr5JM1uzPiEIJhZGq2rsETk+ksRhG6JtCa2QLRU9F64cyD1LpZkLjk9JZ3pHYxwVR5Tom7bfLm8GfbILLBTFdphB9CN1pLY7saJC+m3yz4gM+ehRVlivn2oKAU1EAzQzgd0QkCj98QHSDfFB57NkOpMnNVZ3LXoQ+oGBErkt2QMVdGZ9a8hUFPXxWLeyDyD2SUWfcEOd696AFCP4UBW6eWH+JOzLiRHm7rFcsbnEkvfc//Kk1TxvbSChIAkXmD9L4Bc9s/QAB+W4eL9W1bR0MPdwzkS6OKp+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1704235120; c=relaxed/simple;
	bh=9UNtbbZOnXkVkZz6jHXCKsWdG8aI3jFrmx1yIa2Nt5g=;
	h=DKIM-Signature:MIME-Version:Date:Subject:Content-Type:
	 Content-Transfer-Encoding:From:To:Cc:Message-ID:X-SimpleLogin-Type:
	 X-SimpleLogin-EmailLog-ID:X-SimpleLogin-Want-Signing;
 b=A0vA2Wg+oAuzRyAVm9ILyzZW0fBWWlT8Aft/CtwQ1M5nt5WQTe6Ogqvq7Yb36zKNLRGsgZg0CPDd3vluWgVsJ+cJn/jLqYoZeWJxdHOXXGM2PvM3B9p/95+RZNIuQPRMl+2FMGgxUqjpHaL8a2wlYYj/G4zinqr6EF8tdAoQ67Dnb19ZPxbrjcFSfDsoaC5EzshdeFutAQdu96no73IT6ZfNaGBHrB84UNm7jQUbONQGyoPVeNjIX3pG2vP5RKrrXQSBR5sb8AlIMi0pUh7d308qAuxI0dVK43Ui4dOLWCVuW5vhJWkHWvFtuAVFXOjNWHMUTbbtsgWb3SaGEIhZmA==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=willian.wang;
	s=dkim; t=1704235120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9UNtbbZOnXkVkZz6jHXCKsWdG8aI3jFrmx1yIa2Nt5g=;
	b=QcUHuszjH7MiBDunfFTHMi0T+1+Ewje1L5hKjr4kSbcMFDPnWTSZLg2xVKRzWyw+5Trdey
	SDMPMfbyxyllAZIgcOHV7oMMm3wlUKteNtHKYcn3Yp+t/YB8j24cMRmQd6ue41+2hT6wJ8
	mETgDgu/VzLQixrv0zN4dqwDgszPtWQ=
MIME-Version: 1.0
Date: Tue, 2 Jan 2024 19:37:59 -0300
Subject: Re: Oops in hdac_hda_dev_probe (6.7-rc7)
Content-Transfer-Encoding: 7bit
From: Willian Wang <kernel@willian.wang>
To: peter.ujfalusi@linux.intel.com
Cc: 
 tiwai@suse.com,regressions@lists.linux.dev,tiwai@suse.de,ranjani.sridharan@linux.intel.com,pierre-louis.bossart@linux.intel.com,perex@perex.cz,linux-sound@vger.kernel.org,linux-kernel@vger.kernel.org,kai.vehmanen@linux.intel.com,lgirdwood@gmail.com,broonie@kernel.org,alsa-devel@alsa-project.org,linux@dominikbrodowski.net
Message-ID: <170423512017.9.491093800173465800.241687161@willian.wang>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 241687165
X-SimpleLogin-Want-Signing: yes
X-MailFrom: 
 sl.lmysyibsgqytmobxge3dklbageydkmzzhe4f2.gepnzhmnjvygg@willian.wang
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: S4EHMSPPC3ANE2OKJSO6LWVPXHRIG45X
X-Message-ID-Hash: S4EHMSPPC3ANE2OKJSO6LWVPXHRIG45X
X-Mailman-Approved-At: Thu, 04 Jan 2024 09:22:37 +0000
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S4EHMSPPC3ANE2OKJSO6LWVPXHRIG45X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi, just tested the patch and both sound and resume-from-suspend are
working like 6.6 again 👍
