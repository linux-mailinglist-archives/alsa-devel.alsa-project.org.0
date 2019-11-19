Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA258102BB1
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 19:32:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74404168D;
	Tue, 19 Nov 2019 19:31:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74404168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574188358;
	bh=f8c8dOHD5SMJ9c8v+ydhwmqb7T7p27Des68PuVDhTxA=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QpvAtmeQx+rJiaMnGbOWlKKprivNp84nVqvRZyHQZCMdHA6XQQchObMaGgs1KbYzH
	 Sm+A0aNv9gsHKy6a/BmlRq33xXSdQpQX2Q2bJ/dzVZwU3LAPSSYlGT/jLkZnckunr7
	 JfbGwfym9yIUkMUmj1xLxrul9cVWF04ll/uJA+zE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDE96F80139;
	Tue, 19 Nov 2019 19:30:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D2C6F80138; Tue, 19 Nov 2019 19:30:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59745F800FF
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 19:30:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59745F800FF
Received: from [192.168.178.21] ([95.116.123.164]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N8EdM-1hktD33QAq-014Ax5 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019
 19:30:45 +0100
To: alsa-devel@alsa-project.org
References: <s5ho9nt3yu7.wl-tiwai@suse.de>
From: Jens Verwiebe <info@jensverwiebe.de>
Message-ID: <6ab06af6-71f3-1f24-5706-6537ce4f6f34@jensverwiebe.de>
Date: Tue, 19 Nov 2019 19:30:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <s5ho9nt3yu7.wl-tiwai@suse.de>
Content-Language: de-DE
X-Provags-ID: V03:K1:wK6ievvPFPjv/sVLFZPqOrbsfOB7lOUWkr9ot/fkGQv03ZCg7LW
 3IyjNgf/NnXhC5D+dR4Jl2DV/KzdCCK+FFu+Z5+lEXPsEnHmmmpFVqL+k/++HxjjTSGVf6u
 Jjv7dQjVz7AC6hTg4Sqmxb3F3tPHDq32azntK5rycHDB6kwdM8HFY8XXBJbO0LlJ5BtnHvZ
 yNcNez9s+aglU7tVsIJLA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oQtjEaWhl64=:Txx7scQfLnjkV/4DDQ+r/N
 1F0fSZXZchvA5AiBNXevygimCOJwgybePJk7lTA+gCEmOmD1gfv+ucFD99bumWIMb05982bpD
 0aUgaw/g6HWTB4THH5kUWy11UkVkglgLXooahwUWFGStHwF25pFOHJF9abPUPH4xUlKEJAF8P
 9/Qx1vKb0YwTY7mlTS1v3nI+6vR+0BKyxThC0DgWEH7wk10wDuT66sq6HgBnoM9Wn1au/ojzM
 bzlOTfwvqC9IRmqaoqci6f9mGAEzqXgByypTQwMHVWQEvX/1EYzc4RPSjQ49dEf4ITu4wPJXG
 FkpW4ionRFcAMKxXvR5ixxn3PNXCHt1sHFLr+XmxVKZyRtpia1Qt21KvX6E7oX178m8UJha+8
 mRYUPMkXpsIFxzuKs8cNypvbbmQm7FAx5lzMvEhVpG30LEL4JAGqc15tkzJth/QTk65+U3oUS
 IeEha/CMM9QWoXmkbYItgnxj7EO/amvrqqAqTbF+Ob7pad4c3sihJyEmPDHT8wmUL0UcFGYZK
 5X2wyCfJN1X3ZjH1FxwfHDiiiAzGPriY5mW3zQOos/l+Qds/tqisNQ+Vkp/TvNnBm7g28iilO
 v4F6abWE18jn6j2qwOnICCB+FL37n8gk6J239x8zlA83yxIUvfm0WcN5pJUAsNGTsWLHzlIHx
 OhdaWY94/slcpC5EAas2MiE4JdwgRV6Qsc+dfYl10uE6GM8eQRiYES/H/GHPCjz6M8+wmuTH3
 prvUtj0m6Z1J6imOXc81JVHaiLAzvoXanVtDyVg3qk0GHT77RT8mIP6pR7Ij8DeASObO7vuRX
 +0ALLeWzDVBCdpcFsCwtSiQjvTh6zYd0GAu6oWNzdi3KKRdJZqRV//2fmzREgtc17qV+o7DJf
 OW9x5k461wQj388cWrc3re/TSPx/II14LtNcbbWMA=
Subject: Re: [alsa-devel] Focusrite Scarlett 6i6 gen1 - input handling fix,
 ping
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi

I would like to bring up my forgotten patch up a last time here.

See: 
https://mailman.alsa-project.org/pipermail/alsa-devel/2017-November/127906.html

I dunno what else would be expected to write in there, i think the text 
says it all ?

I have this in use for 2 years now, but the interface will be sold now, 
so last chance to test the commit

if it happens anyway ;-)

Cheers ... Jens


-- 

Jens Verwiebe
Allerskehre 44 - 22309 Hamburg

Tel.: +49 40 68 78 50
mailto: info@jensverwiebe.de
web: https://www.jensverwiebe.de

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
