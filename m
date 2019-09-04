Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFC7A79DE
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 06:31:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 302821668;
	Wed,  4 Sep 2019 06:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 302821668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567571501;
	bh=nCitCXB2xrfIAPozcJ/Phndy6GoJSbmcsiESf7CrmSI=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L/rTMSbbZXXgdnue/n676JjSgMlL4v9SKlSDFV84Yp/Biv6EfUiPm8y5cv01zJGc6
	 4rzPYd4rSE152BoxhD2igolIaPQ4+oF2uPTAjPK+s1KtkQ7sd+7zcD8ZCSGiXvUT35
	 Bt5eA/621q8VuPjjyCsFwyWKRRSLmaC49kgBBjMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE3BEF803A6;
	Wed,  4 Sep 2019 06:29:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7BAEF803A6; Wed,  4 Sep 2019 06:29:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 200ABF8011E
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 06:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 200ABF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="B6KQ7jUW"
Received: by mail-wr1-x42a.google.com with SMTP id 30so8674939wrk.11
 for <alsa-devel@alsa-project.org>; Tue, 03 Sep 2019 21:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=h8bPpYndGMY8fHzb1z12tX/IN5Imv/raFfvURFDTTrw=;
 b=B6KQ7jUW6TueF+ouMvz/0fjPe7GMD/c7JfSOsrGmkajWTbyZ01AxmF9qmbBWCOWi4X
 QqlFWGL6HMqHOf3QFYiA6Ae2P/Z+kRF8vm8Dak0ShqK0/gOWEmBxgF+//d2j3WImW49J
 wtGLusXzdGhxYXoAKOZXosD6l0obKd7TO+aFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=h8bPpYndGMY8fHzb1z12tX/IN5Imv/raFfvURFDTTrw=;
 b=QZGePSjG6p7zoUQKkTvprI2LjZ/ipIpGtwPymWbNFz1+zr4wBqoTrRPg48uXy8jSZZ
 mresHlMGptCeahU3ywVtTpoEjaYdX6DJzNC+5rhZmC4KgOCCR6RXb9v8vdlEt6yz8EHJ
 fYnEZKj+duCaB0+XRtm11oHMEcHcmQ1wMGYipc4BXosjtDtLC+PQ5zh82Xf03FnGhutp
 0WWQxWkWQj/SgTHUYspNBcNvjvrZd0cqup33I3tPlzLXXeCljW8R3jhSjS1w8F7dsi5v
 WlOv5boKLRJLmHlra4pCTnuEQYU7k4g05Rt7L0ot88C8rPKO5JHsZ6qMmEOaD75lZThL
 g7VA==
X-Gm-Message-State: APjAAAVkHZ7EPA6iYA6rYUto8eZQ/vmD4kCVb84XROawHs8YJb+Vy3IH
 TNA3QpUXQ0VYTtYXeNvXj2lubZ6Q7/RBLBPARG5/t2EiA8Q=
X-Google-Smtp-Source: APXvYqyFTOCuKFnFSf5wGm3G6p/IyAwD9i4EAl1Rqhk4zKvyUf73LGLBPI9xXU/Teb1rEph4JEx1cH9J4i7fqzuy/Ns=
X-Received: by 2002:a5d:568c:: with SMTP id f12mr32746870wrv.248.1567571381242; 
 Tue, 03 Sep 2019 21:29:41 -0700 (PDT)
MIME-Version: 1.0
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Wed, 4 Sep 2019 12:29:30 +0800
Message-ID: <CAGvk5Pohb9cxL=Mu11RPVD66NdiZkG+vO9TEtqBWe1tnBn6qyQ@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Alsa conformance test - a new test for ALSA drivers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

I have created an new tool "Alsa conformance test"(
https://chromium.googlesource.com/chromiumos/platform/audiotest/+/master/alsa_conformance_test.md),
which is used for verifying ALSA drivers. Here are some main functions it
can measure:
1. Correctness of hw_params
2. Stability of rate
3. Stability of step
4. Runtime of each ALSA API
5. Underrun and Overrun

I recommend to use the script "alsa_conformance_test.py" inside. Just give
it a device and then it will test the below functions automatically.
1. To make sure whether all the parameters provided by an ALSA driver can
be used.
2. To make sure whether the measured rate is the same as the expected rate.

We have used this tool to find out many issues in ChromeOS. I hope it can
help development in Linux too. If you have any problems or want more
features, please create a bug in crbug.com and assign to me (
yuhsuan@chromium.org). Thanks!

Best,
Yu-Hsuan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
