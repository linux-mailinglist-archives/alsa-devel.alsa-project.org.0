Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAD773DD24
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:19:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21F2583B;
	Mon, 26 Jun 2023 13:18:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21F2583B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687778350;
	bh=dxbYGAyND4gGopHFMVxeraqOfxGEXXMaqN4Yvo4E8zA=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LyVo5wR6JCwEwX+/HLAzWvpRfxuc+9CPZSHEpxfObgtTyHFdKriDA9LNVvq4CURVO
	 UNEWggfaUh+O5tVAMrUbDIclAo9Xr38V0EAtHCSCiaH3Fsp5P714BBa8T9ZNprQr5l
	 VypTrP9pup/XxuV4GBd3vXEpAaK89ebQU797sGvg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61616F80093; Mon, 26 Jun 2023 13:18:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F1B4F80169;
	Mon, 26 Jun 2023 13:18:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5E77F80141; Fri, 23 Jun 2023 00:38:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11311F8003A
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 00:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11311F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=nMO+n2i9
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b46d4e1b0aso1036471fa.2
        for <alsa-devel@alsa-project.org>;
 Thu, 22 Jun 2023 15:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687473479; x=1690065479;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CYHIvieL4PEVxXbitDeELCBlT89Sp8mvDcvuQgJgIZg=;
        b=nMO+n2i9rCOE4sm+HoOEWsQfcN5naIOW8wjQWwwrFsmd9c6Uv1uBOMreXlGOUi9JkV
         iL73AM3kzIUxqiy5cEQxW1gvvKT5M7vD56PqmPZ+ePfbS4RS7pUjid+z0/cawTcaIOx/
         TrQdsUWoTaCFuSOvT7qXhpV8UaQ/B5N+NrpB2zAyY0T7/BeEITyyBBG0t3AzAPqglqy/
         c117SrY8V0BES4YnvZwlYsRZlZ86e+4L+lWDfvgm1+0JfXB99bBygCJ5km+BUP1RH1Lj
         bp6nogSFlyebXS/MxxAaQGck8OiP2uTSNdgNFJwzWRVC18dxx09Uv9WCi9/LcqUsXHGU
         X7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687473479; x=1690065479;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CYHIvieL4PEVxXbitDeELCBlT89Sp8mvDcvuQgJgIZg=;
        b=UQcIhmMlJGuaJPcJAT3+5T3jGcWnx/j5cDLYruXOzz8QKRWr4RWRnBCZEv/AzGyfHv
         eSjTBegxbrmiL5FEL6E6hNNHX7U1AwSnQ+DfhnleZCbQTvQcGggLdBmu/DTtDEkhzSHG
         7SmRYO8IwqMU3prnEwbIJraLoPFs9jAGPNOOIdj7dTNSlEhpoQ6ftRrV14rZplkZ/ThD
         Ih5lCr3x0exXymgGbaDtAS3sOZIbK9ivYNKTtvxeTAqoltSKvF2456q0vZ366HUd1Okd
         4V4GrSSdV4pg7t/Z0wdnzrGWGTLKx6jh0uHAYFaP3bDJDMdDUdgxG6tG5hVt1lDjI5SJ
         OgUA==
X-Gm-Message-State: AC+VfDwRsmqQCTIqJkUUuGh+WqbJr3ReSzG6EwJ0NcArO3m1+iv7DynI
	z7/V7WTD1Oe+SrWBy4tIHApY0+n1hsBuzfvq+Uc=
X-Google-Smtp-Source: 
 ACHHUZ7lrd2dGIusJAH0Uh4NsHq1V+8+0qoYPtGw1nT/mm839TSPohAKC0st4PGtg5LqrDMBXWQhxXD06gtd7uszSQ8=
X-Received: by 2002:a2e:b059:0:b0:2b4:6456:4545 with SMTP id
 d25-20020a2eb059000000b002b464564545mr12076442ljl.9.1687473479203; Thu, 22
 Jun 2023 15:37:59 -0700 (PDT)
MIME-Version: 1.0
From: K Smart <ksmartluv@gmail.com>
Date: Thu, 22 Jun 2023 18:37:47 -0400
Message-ID: 
 <CAMDAPPhBtjhsNfy5D3mFGkkHxUdmdfEUy6L1tbgMfnS3fvOwhA@mail.gmail.com>
Subject: Re: [PATCH 6/7] soundwire: intel: remove unnecessary init
To: yung-chuan.liao@linux.intel.com
Cc: alsa-devel@alsa-project.org, bard.liao@intel.com, broonie@kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
	srinivas.kandagatla@linaro.org, tiwai@suse.de, vinod.koul@linaro.org,
	vkoul@kernel.org
X-MailFrom: ksmartluv@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IZVPHHJUD6NACOHDDJPTAZYVQR3EGBAR
X-Message-ID-Hash: IZVPHHJUD6NACOHDDJPTAZYVQR3EGBAR
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:18:15 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IZVPHHJUD6NACOHDDJPTAZYVQR3EGBAR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

UkVNT1ZFIE5PVw0K
