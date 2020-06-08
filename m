Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C8E1F1A74
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 15:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D32A21666;
	Mon,  8 Jun 2020 15:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D32A21666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591624532;
	bh=+lO5rhCh9+fUN7MvvqOtweNDVyY6Q/kFyUZrMiU+luk=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CfHO0rxkPy9W9q0jXq1gaccFq3rRUMGDoZYdrIOBtbL+v/1yL1xvrmOPTKnfmuznT
	 tHIs0mxH0nJXPVn2c6pRVuy/YzSjMr1e3KJJnZpuLNcNXRp9qe9iGM0rtSa+Towv2v
	 m+/QE6ihKo9y58L7xeci8vEsaTRiqrYa2qeZy5oQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0A68F8021E;
	Mon,  8 Jun 2020 15:53:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51465F8021C; Mon,  8 Jun 2020 15:53:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from sonic315-54.consmr.mail.gq1.yahoo.com
 (sonic315-54.consmr.mail.gq1.yahoo.com [98.137.65.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62412F80124
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 15:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62412F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca
 header.b="KtH6DbBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1591624417; bh=vPdSC9RDi96NLOsNFr4cII1XXBVFfG4RFcgJU7lzBr8=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject;
 b=KtH6DbBtit5olgOZtTxegWp/7HWrpwdOCvcrN1j1GwUQy1CQIGp7qznZ4EhLTKXAf7AQnCPZBe8abrjThPLhhkgsP0dW9VjxZzUPg8vrEFN8yBYNsEkihTW1lwISIEVn5eJcZrovOfXHdEFcOUWEElK/3nU4YByGpdxM/KUaMEymk/H/Le8bS4URa69DXTmNWG+P7ixC92u3Ar+qqA48ecG9zhbU0WUTJfTGIMeIWEWahqn8IgDzMyhvutzncqdXcAXpaBmabkuDfbDuo3sPnUmLMFv+i5kA8u1oBJqe7U0ZAmSs9WpR7GYev28c0mcU7qvoG+N1aeY2P5be2WP44g==
X-YMail-OSG: KWOfl5gVM1lx_Pq.Vy9gypwnAmgIRXKJ6qHlvgPn5Plidk5SOt.dJJbx8OOKSFp
 EK7FgREj18k94yIzvaozi_UrzDr.yhDQwc5A1_qV9SGeWnr_AiHYRUeIR_pegP5qqgNjLDHF3t_H
 lQxTEYJ_Mhtj7lgEyDz81zsCRM0aW9YoFyi16yrA4lWnaLROgGL9fVaBrtxAKd6ixeeeOYPiI7a2
 3jIyZl9VTG0iD2j8MjJYv.RgysP0_OYuGOHfuw1GCggUYULvomcJJaQDKTgW46412zhbph.9SpZG
 rPaMs_dT1N6gQ8sACwD8Pkw_zuzKgBny6YT6xLzBsFG_oI1rvd6bdKgShN4jPhmMiRI6PPuto4eq
 F7YOrNtCTAPIPpuJgpu9f5kO9.2BdCEwKQxTfwcTZ_BSu3xnq4mcBv4l7HQ7Sp479cjkTV2ZU5jZ
 wcSKbv.gR_iMeIgruYTwFfMw3H.XlBro9DYKeBhsdY_2UqzcHIi8_6HCs2glxc6dsg4bynWGRqfZ
 uqpml26N8NTrUxbCXPahXC65DCCvqVhiY4fcgp8KONEemVsTegXfAYNwUKShmKhb0yYJ3o4DH.9g
 xsscqZGexdIPuFS0uULYlEJQ2gUXV3Si_ptC.HoRjxw.on6yUvDGWFYDCTVEPqcft1WfP2L8xxpb
 ogaUVEv_subbu8z..FZ5HDh8AzrP_hFSlUPjnsSuYjdKZR7VlbkKSzqyRfrTOlSpo_reMktIU3Je
 VD0XYA5jYUDPQk7YJylAH4w7AHUOGS51iA0pOjiletpEOqRJ8UcyQKzNTteGDA.6BsQmEC0Lw_sz
 IOsMnwAHqNCIcEEscQNJ9b5BrS_dPYO5qWUefzjdoN5mRdt0zFKPg5AfSsqfWTLU3VKaDkWFPka9
 1K0qXK6p2JPzsgclGwFMP9WdluMfLbazSgA.qD74bUjoScE8iF3YA5uRXX1DfPNVVf08M6sXLpvV
 ltMhWxBXTSv1VNEYL9raRHaOdGZauMjxk5C7JpRlofFDKeKhNaW8tsDshwHljW.Jlg0vwfKi0TE8
 wP.N77DChpGqIoyFXH048GLZ.Xnr5jdgfQb5UgT_wa.JZsst9FMFResrMKTlEMN2jI3ubrpcA50I
 5jgMQ08VEuhBPL2L3JjehjGOclx.WZuuuQRKyMOdC3abS3ZXVNeyO_I0Ocmbt.tajimZ15wIVj1A
 kUH57Wj58gpWJNXRudqy5vZF9CwxtgrtvEAA_POEn9yVerWYTqQLtDQj6yaw2Z5kCicr8PAEpotb
 yu6B8Sd44Btpn7fRUmY6TXdjie_9f1KVqiD.Ecofp7pu0CSxyvGVixKedv9_dD.GC3DVlVla0q.p
 nZ1Gr8v6EtcSj6yikEVsoIVjFZGEMDOFKgtbMBC6VDNSPP5908V9Ut4wnvUBZvkdH4vOJOOMIIUL
 g4usrgBmxrbad4Qk-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Mon, 8 Jun 2020 13:53:37 +0000
Received: by smtp432.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 41c78898e8df852c9e385165cee1cd32; 
 Mon, 08 Jun 2020 13:53:34 +0000 (UTC)
Date: Mon, 08 Jun 2020 09:53:30 -0400
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: next-0519 on thinkpad x60: sound related? window manager crash
To: Christoph Hellwig <hch@lst.de>
References: <20200520111136.GA3802@amd>
 <1591545088.74ii116nf2.none@localhost> <20200608061950.GA17476@lst.de>
In-Reply-To: <20200608061950.GA17476@lst.de>
MIME-Version: 1.0
Message-Id: <1591624340.z01ejtod28.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.16072 hermes_yahoo Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
Cc: alsa-devel@alsa-project.org, x86@kernel.org, rientjes@google.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 mingo@redhat.com, bp@alien8.de, Pavel Machek <pavel@ucw.cz>, hpa@zytor.com,
 tglx@linutronix.de
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

Excerpts from Christoph Hellwig's message of June 8, 2020 2:19 am:
> Can you do a listing using gdb where this happens?
>=20
> gdb vmlinux
>=20
> l *(snd_pcm_hw_params+0x3f3)
>=20
> ?
>=20

(gdb) l *(snd_pcm_hw_params+0x3f3)
0xffffffff817efc85 is in snd_pcm_hw_params (.../linux/sound/core/pcm_native=
.c:749).
744             while (runtime->boundary * 2 <=3D LONG_MAX - runtime->buffe=
r_size)
745                     runtime->boundary *=3D 2;
746
747             /* clear the buffer for avoiding possible kernel info leaks=
 */
748             if (runtime->dma_area && !substream->ops->copy_user)
749                     memset(runtime->dma_area, 0, runtime->dma_bytes);
750
751             snd_pcm_timer_resolution_change(substream);
752             snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);
753
