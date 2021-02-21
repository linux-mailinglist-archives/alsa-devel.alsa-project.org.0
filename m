Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44622324F1F
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 12:27:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 760D5167A;
	Thu, 25 Feb 2021 12:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 760D5167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614252437;
	bh=Ii6mCKLdMk+Svk1KpodaVpXsreuwHJe163Dne4id3BY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mhOpMTtjj9tmWhqExuYVMC6R09eMqxJ1bUXZ7WYP11Y3mpRVkEwmcPftHBq8DffGL
	 eCokpyEK1fgroNmX64vBeWoKpofqkex0dPcpWGEZsT73amZ0B559qEGwCggPOQTYbV
	 nQI3vLvyY0sHuf1WJPaGIIaWpkRYa1hvyHTjpOm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D724EF80278;
	Thu, 25 Feb 2021 12:25:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15520F8016D; Sun, 21 Feb 2021 12:30:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75DB6F800F3
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 12:30:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75DB6F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d2UE9/90"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 695B964EE9;
 Sun, 21 Feb 2021 11:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613906998;
 bh=Ii6mCKLdMk+Svk1KpodaVpXsreuwHJe163Dne4id3BY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d2UE9/90wdqjqqFrZcVN+lTrlsYm+8czUPx5JO6BrG/WVVOqbOaiL5ATqk5/0egaE
 dJnljpBaBvbmOplzqcx01DAQBW0CuXXdMjM4XR41EMTG+zVaeZxCGgTQEVIp7ddpLM
 RVo4YCqXp22TWQUr7E5zuS8OCeJb76svRj3Ccff10+KuxERfmJf6zNcAuMlL0nhp1D
 uSRJjtz3c3vJv0iphQWJ+Zqe02+q4i2M2cU54DLVi/FzKQPCCAFjtZSjlPg8ru2FLc
 0gobWBdFuswyDj1IUlaQjrID+S7n3t4QN/OMH3ktSdvT/7lJ/YkVgGFb4+DHm2Omi9
 DZu7SBcagsfLA==
Date: Sun, 21 Feb 2021 12:29:55 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 2/7] HID: lenovo: Fix lenovo_led_set_tp10ubkbd()
 error handling
Message-ID: <20210221122955.2f933b14@kernel.org>
In-Reply-To: <20210221112005.102116-3-hdegoede@redhat.com>
References: <20210221112005.102116-1-hdegoede@redhat.com>
 <20210221112005.102116-3-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 25 Feb 2021 12:25:30 +0100
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 alsa-devel@alsa-project.org, Jiri Kosina <jikos@kernel.org>,
 linux-leds@vger.kernel.org, linux-input@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
