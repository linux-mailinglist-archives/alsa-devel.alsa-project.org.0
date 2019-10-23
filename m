Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7071E175D
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 12:08:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CC121671;
	Wed, 23 Oct 2019 12:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CC121671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571825336;
	bh=FIWpbBr2kIuPo0XUcLj4sHZ2i8YHLrMbAa3BE8vkKJo=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=nh7LmpHLC97PdWMAv2aC5WEeoaRyfutB45Ca3TtRs7hFmszIOlLn7wVrTyIclBbkp
	 3pDLI8ucRvf4cSK+pEUfdMbwAFdjVdLmAnTvkbLkJaKOrMlA8IUupNGs6q8tClE2uB
	 ni5kcHT/yrckejVrl+rhOjuOb9HoSnnUpy6ZEaJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F599F805E2;
	Wed, 23 Oct 2019 12:06:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 510B2F803D7; Wed, 23 Oct 2019 12:06:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sonic301-21.consmr.mail.ir2.yahoo.com
 (sonic301-21.consmr.mail.ir2.yahoo.com [77.238.176.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5519F80274
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 12:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5519F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="j46U5SEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1571825192; bh=zQX4SK0WkpbplQYjmPufndVIAIt9xstdiqFXOxMwcX8=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=j46U5SElUNlTSwDthuPPUyBvS/ceh6GiSHGTl9waa/C5kjZAUrDCl9Ea3R3z6eMYwWYuaQYgdYD27/NwTZU40KJYLWBvlCyMXSC/M4zzPZR8Lwk/whnYJAokNxXGOvrNJND6OMyx8RNHXA7dQaeQFqTgCSCNB85M3W7yiI+Psag+TnV0a++LicMPBehdUaAkCzoW2QQtSmBgv61G70Y/3GCvkDd1cNPW/Zy5/ygVgAmU9He0KJags5HmGt5lId+rj4SuBzfcXDW2Z6z61H4dWP92mNdMCSc/HvMdKF/0AdGBNFv15HmbbwA2OT3XeiAefOafCS3ESBBD8N5/ue2Xmw==
X-YMail-OSG: lQUacowVM1mM1SJUmOn_8UkNqTd_KYFY0uumYw2nkiila85hadnH11DUI7Phd7E
 QRdqF9YigdQacmBbgg9Rw.PNRK.PTYLCyd6e09vab2aHz5pBB0qgmeNOhxX6a_ghtATMmR6R0KTg
 hUSetdDEyyP9kaBTyasZFpkgPRjxXSmBWE9m6o2ZWMzLCPyN4HBYZNnvyoohOQ.Ig70hmO.hcn9.
 GSQBVD5md3TukW6Ix6o_UucGNQtSheXa3TZQlp9XRD9BGCoDPVGNuGNiXxdyE5UD4eg_i9TFo3Yi
 cMAYZ9XQ00Id9oeXJpU8KsCAu8upXem2EBepuNDoHoNjXCIIDW7dS9hNKbqZMUc2N032VDERcgci
 cIH5qJmwJNhNeFZ94pTqbL2fYnJl8u2PBEACnsruR18CPn21RkUzD9Ubqdwk9TCfXxekbojK344e
 WnHBQtJD8C.FXVy.pon2RWwLN_rp5fqmHltUPOsDcePZONehkGuW0lxye0nUmIwqbN_6A_dtgaEv
 UzAFMLQqXC4GWDPpBO2EU4jjfevrY6XIJ8KnJB0YqhvmRgfbBv91A2IV1pGhC86fLV8e66Y2pUQj
 5HupGFikJPmGOUQCgb99EdUrGj4Y.V0f430Zy22iFHf0xckLaGNzyX61S..vAAmSpH52xI1IwnNU
 Wgdant1Sc0zIQE5MopoLixWpG7E1cHgNaWWnxng_ug4f6PsieytcZYkjefrckpO5RwoSIjmkJnsj
 uSPsREDibUqJan2MVNN9GJhNdrNnXequ9_S3skqbBBcDv5ro6BYw4wm1LBQS2x2cLobMFZ6HFE9n
 _JrnRc8765M_xmuKY.52wAHMixkflU6cRJjoiIeOEgnZ3PNQPK0PszgKh4rdpgJzZ4ZsBQfqEdtw
 KgZtHqqNaRfj9dJDodr2lFM.4_XIxRIqTNOqgRsbTS5gvsmnTKnUCPZM75pwdim9zYT.rKbnsG8P
 IUFY6gvpK2kmC0DIGFogtrljPvfg7cGr0NmE_RdV..AWO1VDf0llFf_Q1xBrSHXiM9bpuzE_CJ4.
 bxnwH1pe0XaW_nqx8VF8O.rP1yXzul543L152QiyAHudH2Qysf5mrZY9X2knqT.jt.y8VYsV2ipC
 1WatqrLXdlzFXhFhDA.TerX_GJldh6cIoQCxr6rB_en6Po46B9pXz9M6ZmLQrxPqAgTN2wINV2u6
 FGcX6u6MzOwdTNjEEqQAxZWcsh2E2tKP_ujc.ofym9up3z4L79VvmSfwmwbJCAglDhCKXh2ZWuLU
 li0HwkeFfvmD5xH5JXpcPKu3pRT4Ax.cK32mXtTau7s4Y6VRmop1OhRjNDmDJz0mLjVEekwXqQHy
 lqB2.wcBHKDg83Us6VJCHyU2Ny1CCFoAQclKH
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ir2.yahoo.com with HTTP; Wed, 23 Oct 2019 10:06:32 +0000
Date: Wed, 23 Oct 2019 10:06:30 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Message-ID: <2032382842.8699829.1571825190730@mail.yahoo.com>
In-Reply-To: <CAGvk5PpUjn0r_sCD-1mpbaKQs_BmvjXnZV--bpRLCbdHRVDShw@mail.gmail.com>
References: <2146461867.4835752.1571321696465@mail.yahoo.com>
 <CAEy1m_CXrhr15RZz_Q+TiMGj4DMBbUV8sCobmmkhguYJWCw03Q@mail.gmail.com>
 <572375501.5493214.1571396197926@mail.yahoo.com>
 <CAGvk5PrZ65wEp7y7UbtEN2CCf6c-wvoknMKyTmuqXY9EPg7jiw@mail.gmail.com>
 <43747502.7351282.1571666231987@mail.yahoo.com>
 <CAGvk5PoYYikRL90Vn2GxGWngwaaYzZwe6UX_hcjfAnLeBwvy=w@mail.gmail.com>
 <925340775.7968852.1571737181376@mail.yahoo.com>
 <CAGvk5PpUjn0r_sCD-1mpbaKQs_BmvjXnZV--bpRLCbdHRVDShw@mail.gmail.com>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] alsa conformance test fails to run for playback
 (and works for capture)
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
Reply-To: htl10@users.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

 

On Wednesday, 23 October 2019, 04:25:30 BST, Yu-Hsuan Hsu <yuhsuan@chromium.org> wrote:


> Hi Hin-Tak,

> Good catch again. I have fixed it in the same CL. Thanks!

> Best,
> Yu-Hsuan

Dear Yu-Hsuan,

I am glad it is all working out in the end for the better!

Regards,
Hin-Tak  
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
