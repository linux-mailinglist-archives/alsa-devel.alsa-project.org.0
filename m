Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AF5365B15
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 16:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 273311682;
	Tue, 20 Apr 2021 16:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 273311682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618928500;
	bh=gc9pPwTR+taPtha3SUREdlIFBDfp+vgalB2s9uB5zf0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=Vl1dUFRlGP9AQupMuggQcYgzf0MmxOa20zs6lg0DO+dfpUuFnALnxxJqWNl/+BR4V
	 +wG+PayApeb9YGDBtYKG45ZhwXTBlKRdlRxUlDM6VcmtKj2f7iby84jzuOKvTjtLK3
	 MaidWHMERuSKWdeO0gT4LvfA87UnH/N0vXdeyOdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A27C2F80253;
	Tue, 20 Apr 2021 16:20:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77BC9F80253; Tue, 20 Apr 2021 16:20:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sonic312-25.consmr.mail.ir2.yahoo.com
 (sonic312-25.consmr.mail.ir2.yahoo.com [77.238.178.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE7D6F8014D
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 16:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE7D6F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="nYscb5OZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1618928400; bh=8UoDolzH9lPQA9GcOdnNAtc/07UTeQSlwSuNb0m3y1A=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=nYscb5OZhB8jut5My5D4LzaQDytsedWRDBs3+xCNP/6ronNwU8iBsuGtv/1MPh7vd+OS/wpDKrdPJDl40Ek4DXpAgnrV0qZMW80GGtEvrAyVWJjlVEOlVhtxDMD8xnOKe9ATf+YwdoasiNH9kJF15mCzZDdfOFBYBFDuRIdpNIZ1vfxLtHXieJy3YCULRTzIWNca0am5rTOaDZyosVaVcHTgjflKH4xDY7fTFqnF/3kDfl8QM+h/aOcUYUfaoxlzSfxp/FFGDCe8rOqaOCMR1oSO/fDOlyZYywYAnySnCc4rmXibpamRq20fISpM+CN3TVm/HyNBAFFd4+4EzR7psw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1618928400; bh=ClQTi1wELF70gd+q7FNZLWyIpGyIXXPRgkJUXvhOGws=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=SvUvxspimLK7lQ9dFhmsa5HZJpQeQNygyDz1YavHGBVLgIo0cPfaqpZxfdwCE7VORhs956icfRxCTHBEBsCf1ztpsaeyVqb/cafjxdCxgQKHqQ4uy5w40wVkxV4MygGklOPOirY2+p9I1zTjeaTQ8ELGd8qC+WJixidEZo7Q4kv1Nk38pv8MQOsNL3M4NiVh2wv/2lvL4qOfbr2dV+EPSqtRXQGIZV0Jqk2ZLGtxW9tGfTJ+9kyHraKrPpxOX+/mVvbhowcfvjwOlk/12le5j+jCUW+QkEhsUBYp2lUSA4SZlJgnp/qaDRWRNmAAhmsEdq7NKfoBIf2p2v35NXGbrA==
X-YMail-OSG: 7fSFzGgVM1lOfG4JZuO_4qVoyVvqkCLpFOxF46TDAjFUKCvGSXP_9d6GdDotWan
 D39HBC0a.sTxZbJJMt32ptlEC.RfJuibV47VTLLOt7z9q8ticZjg_yDOs7dpLED9Tzft3atb3cC.
 jGYbwhRpLbJzKjuL5o7LHEM3XzsdG_4tqeni_Pz_BdH_XPBvJbswqWOrow8uABX0u9rcN2FeRWTz
 gO1aa8vhtxpk1VtNifuoRDvegr..D15fgwMO79a6yTDYXzZVmVKHFORKEXTi26H_OZy0MPPlOYDo
 TNrkWnOkG07slhzciOLnjlJorvA_YrbLoqe.g1kE7R6T2YjbXCjOS6NjM7j5GdNfWZ1Pcjh3iG6c
 ihcR9C7OXI6IbzXZpp5xfvoPqM3ORNA4XFRJk8wVm8eBUvVAdsDCYIO7D4vBiiJweDOwzi9r0Tzr
 EbEdXfgFqxx2M7Re6ZTEJSjuBPfsGcnww038WEENkgiBCUJoM1wlX3Y4W7sBEb8KkFbe0qFlpzsE
 6Yb0UXY5fWQKzyPKqnUZ6tUzfXH5n4o1.IGJB8DJZmXWKcADHwcp_RfSiv52qxHv54imuE5IOFG4
 mA5_nh.3gQ72k.xuSuLs8lVtD5jAICiNCoWG2qrDlM.AcRiTT0dkVaScckHjw_qm48tAHCDN77GD
 gUjqldGHRCe5p53K_QTvK9WsNZv5ihkihXG3xosebXSPgWSvWFUFDI3a.vGO_kmLBsxQrBQgPuSN
 zWgUA_Rm_uoT8.u_imhG3AbTeyMRGPlgMzzucAYkgqm9McskxZIxo9mSWE3Ro2bn4hE9I.eka6Xv
 hXAqBSewRO2LUH8Ipea2i1wbAMcJ_0lFPSRYGSmuWzJrfdWyLdQk4sbHb7xE5qOUuhzpk7xduEav
 QggLZCnUr6ISZ7Jl4P3LFjs3F3oaFQMdAhKFWFtMZY1q4smf8eZ.kbxqb6RXipoZ55kssPVZi8AS
 qn6cqIjVcWusoLbyhwt_IXyftMUN1grBZWjW7CS3sU0TxekY7NJ4tQW.XPS7qnFhLfJEbBWQVqqQ
 wl5dwRjaomj0d5sHY8A5TQ4ADyPfPkL8G4E.lxxi6WlR3TEzDaHvKt.4uT1xPqIcPCINU6p5NgBR
 34mcLdBuutgqTCGk4Kb02kn4XdqIfpEe_taqU4pNcsWg5BZ1tWO4IDvZ9OoCG4kYmz8yo118k.ym
 Ht8irdZ0O3O5Q2Sm09y_ri9HL3nKhoVDKioMBPYDe9pT_cyBO7_caAW8t9wYL.Ba04ncG7qEt_p5
 hA96sl.mNbB5yARJbnDz02WD4C8aARze1U9hQRBmnMnZ3Wz2gOQlK_92xWklg1O4hNpydg_xbf9D
 fqHE2eQiUubR_lolZKeIPWf41BIScWXW3sjBjteIQpFsXbN2rBIR4fG34Ob_svSdJjdzg2mE_1sC
 HDy.nsqg_KlB3hCsDYrUJVFmoHsDtHRaJpXRk14AwIDim.VrFr8CfPmZZDiLa3A3s0hCpQg3rgWz
 5vM2MkYcJ4uRrGPyepTOBcj8AjkKUMeSkjZy_oLZVPd0EAoKXHczyaaAU8SCKLNUs8uapnRL3tjP
 fb8ZoLFIh3KYvE1UGxfqwTtdPF_pjvfcNkdKjor9KCFOfwUPXWAYYbbvDa5xmi1seN5ah_78s.LG
 5MJxbbNSnm2pbadkfKMZlDvZyzfWhNRzhmvtZVNGhdBEohgT9xaH_wbZUP86p_QlI09G6FDKtKa5
 mFUvVCY_J3V6r7ELZ8UXmtLZJGXQI0RIcgWYeNoNgsD4vJWPrAR55BGo4Xtg4LZQ7l6yxJ7tRH_p
 fRJ92aRijn1qKIPuVRlXcGv8jdRN0Yvt6k7A_IfHse7XsMFAx7NhkVzDi3BOHe2d7.xq.ADS1L64
 lG.lLteqVJqN_ALfuELSmf08yc_l_aieblJLcW2AsGDWEPKfilhsstuCNBq8PZ3d5WlX4koRjeoi
 A_1oWrTyDU6YiaxOHTuQQG03T7EsyV4trFFBIVrXP3H_Aq5Bn1D.b_HfiTIj2W71CoAMkdbI0.5u
 LIsH.nvc3LS713SozZ4LLYzU6qtLbxCfjFCAxxLzS1zYtX13ybkBPuJtpnnuK98HviYWqum63wEX
 VUDi4iuBLoGWakUOO0YxKLnzLdimMhPCagDCEOB6ipQpEGqamMCm8WApR15AnKLx1d.qJQonKPHe
 lhRNpg20M4AvXPNO6nU_jhRyD0vwRk8M2iz_uDJjGSDiX4_.83IVGwEPUCGArqH9FCZADEpkoVBt
 sc5yA5uCdWUeYmHlkIm1vGL331lyuP5JOV_LU6HMlm4fu3XMc5PiM43ganBPv2uppJBUe3S.WvO8
 Ed9D.qQMnAdnYr7JApDAMchMFuz3LHGlSMYwQJI51GE7PdsVdwB0GWi6l_rLKdP3nUItlQddj_8_
 jPAIg2aYXg_HwiwN1WC90aJCV6R9S5nZ8ERQo90Jja8QhTaDv92u5DRITDq9nJWZSa64jg49WLIO
 do7VbcV1B8_vcIlVa9Dgt80gnnvES4M0mNXOrPXXXoyftvGm3Llx2cIvJOiHJ33LmRTAtpQqfWhZ
 gskm0zu9wpZBbAULIvAVFpAsyhGK5wmfldFOBo0X5m4LIox5GKp.PDe89x5..MKf57ubV1NjW__u
 ZBYJMWyVZE.JtIHSwuzQ5cLlLxT10QBIasSeWxLCD8dgvTsF3c12DLmVmaB4Mg9.T8_gu5r.kLrJ
 8t7smVyKfTw--
X-Sonic-MF: <htl10@users.sourceforge.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ir2.yahoo.com with HTTP; Tue, 20 Apr 2021 14:20:00 +0000
Date: Tue, 20 Apr 2021 14:19:58 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <212419469.6653726.1618928398310@mail.yahoo.com>
In-Reply-To: <87h7k152du.wl-kuninori.morimoto.gx@renesas.com>
References: <148484793.4894421.1618654607945.ref@mail.yahoo.com>
 <148484793.4894421.1618654607945@mail.yahoo.com>
 <877dkz5hz1.wl-kuninori.morimoto.gx@renesas.com>
 <1772063602.5910217.1618841824599@mail.yahoo.com>
 <87h7k152du.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: ASoc / PCM recording-related regression between v5.4 and v5.5
MIME-Version: 1.0
X-Mailer: WebService/1.1.18121 YMailNodin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_15) AppleWebKit/605.1.15 (KHTML, like Gecko)
 Version/14.0 Safari/605.1.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

 Kuninori Morimoto: Apologies - I have finished bisecting, and flip the problematic commit back and forth twice to confirm. It is not one of yours! Sorry about that.

Hi Peter:

I found the commit of a rather unusual regression between kernel v5.4 and v5.5, for an out-of-tree driver on the raspberrypi. Everything looks identical between v5.4 and 5.5, within accountable differences, even with debugging in sound/ +p and the driver side. 5.4 records fine, 5.5 stucks on recording. The commit is one of yours:

commit 4378f1fbe924054a09ff0d4e39e1a581b9245252
Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Fri Sep 27 10:16:46 2019 +0300

 ASoC: soc-pcm: Use different sequence for start/stop trigger
 
 On stream stop currently we stop the DMA first followed by the CPU DAI.
 This can cause underflow (playback) or overflow (capture) on the DAI side
 as the DMA is no longer feeding data while the DAI is still active.
 It can be observed easily if the DAI side does not have FIFO (or it is
 disabled) to survive the time while the DMA is stopped, but still can
 happen on relatively slow CPUs when relatively high sampling rate is used:
 the FIFO is drained between the time the DMA is stopped and the DAI is
 stopped.

 The problem was initially at https://github.com/respeaker/seeed-voicecard/issues/290 
then over to https://github.com/raspberrypi/linux/issues/4279 and finally here. The "seeed-8mic-voicecard-overlay.dts" is the dts corresponds to the problematic device ; The one with similar hardware but okay is "seeed-4mic-voicecard-overlay.dts" .

The Raspberry Pi distribution raspbian jumped directly from 5.4.x to 5.10.x at the beginning of February. Considering the change has been in since the v5.5 merge window, I guess I'd like some help to correct / workaround on the out-of-tree driver side? And probably some new dev_err() message in the kernel for problematic driver helping to diagnose similar problems in the future would be nice. 

And everybody: apologies about the mistakes in the initial posting.

Regards
Hin-Tak
  
